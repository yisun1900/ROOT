<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String qyrq=null;
String wheresql="";
String wheresql1="";
String wheresql2="";
String wheresql3="";
String xsfs=null;
String dwmc="";
String ssfgs=(String)session.getAttribute("ssfgs");
String fgs=request.getParameter("fgs");

String dwbh=request.getParameter("dwbh");
if (fgs!=null)
{
	if (!(fgs.equals("")))	
	{
		wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		wheresql1+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		wheresql2+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		wheresql3+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	
	{
		wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		wheresql1+=" and  crm_khxx.dwbh='"+dwbh+"'";
		wheresql2+=" and  crm_khxx.dwbh='"+dwbh+"'";
		wheresql3+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
}
qyrq=request.getParameter("time1");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	
	{
		wheresql+="  and crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
		wheresql1+="  and crm_hfjl.hfsj>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
		wheresql2+="  and crm_tsjl.slsj>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
		wheresql3+="  and crm_tsbxxckcjl.kcsj>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
	}
}
String qyrq2=request.getParameter("time2");
if (qyrq2!=null)
{
	qyrq2=qyrq2.trim();
	if (!(qyrq2.equals("")))	
	{
		wheresql+="  and crm_khxx.qyrq<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
		wheresql1+="  and crm_hfjl.hfsj<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
		wheresql2+="  and crm_tsjl.slsj<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
		wheresql3+="  and crm_tsbxxckcjl.kcsj<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
	}
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql="";

try {

	
	int xqds=0;//����ǩ����
	int gdhds=0;//���¹��ػص�����
	int wghfcs=0;//�깤�طô���
	int bscs=0;//Ͷ�߱��޻طô���
	
	conn=cf.getConnection();
	ls_sql=" select dwmc from sq_dwxx where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		dwmc=rs.getString("dwmc");//����ǩ����
	}
	rs.close();
	ps.close();

	//����ǩ����
	ls_sql=" select count(*) from crm_khxx where ";
	ls_sql+=" crm_khxx.zt='2'";
	ls_sql+=wheresql;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		xqds=rs.getInt(1);//����ǩ����
	}
	rs.close();
	ps.close();
	// out.print(ls_sql);
	//���¹��ػص���
	ls_sql=" select count(*) from crm_khxx where ";
	ls_sql+=" crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.hdbz='3'";//�ص���־
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		gdhds=rs.getInt(1);//���ػص���
	}
	rs.close();
	ps.close();
	
	//���ֳ������¼
int kccs=0;
	int ALLkccs=0;
	String clzt="";
	ArrayList kc=new ArrayList();
	String [] bk=null;
	ls_sql=" select DECODE(crm_tsjl.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,count(*) ss from crm_tsbxxckcjl,crm_tsjl,crm_khxx where crm_tsbxxckcjl.tsjlh=crm_tsjl.tsjlh and crm_tsjl.khbh=crm_khxx.khbh ";
	ls_sql+=wheresql3;
	ls_sql+=" group by crm_tsjl.clzt";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		bk=new String[2];
		kccs=rs.getInt(2);//������
		clzt=rs.getString("clzt");
		ALLkccs+=kccs;
		bk[0]=clzt;
		bk[1]=String.valueOf(kccs);
		kc.add(bk);
		bk=null;
	}
	rs.close();
	ps.close();

	//�깤�طô���
	ls_sql=" select count(*) from crm_hfjl,dm_hflxbm,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh and crm_hfjl.hflxbm=dm_hflxbm.hflxbm(+)";
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		wghfcs=rs.getInt(1);//�깤�طô���
	}
	rs.close();
	ps.close();

	//Ͷ�߱��޻طô���
	ls_sql=" select count(*) from crm_tsjlhfmx,crm_tsjl,crm_khxx where crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh and crm_tsjl.khbh=crm_khxx.khbh (+)";
	ls_sql+=" and crm_tsjl.lx='2'";//����
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		bscs=rs.getInt(1);//Ͷ�߱��޻ط�
	}
	rs.close();
	ps.close();

	//ArrayList data=new ArrayList();//���ܵ�����
	ArrayList<Integer> data = new ArrayList<Integer>();
	int sjsy=0;
	int sjsyl=0;
	int sjsyz=0;
	int sjsyc=0;
	//���ʦ��Ʒ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sjfa='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//���ʦ��Ʒ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sjfa='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//���ʦ��Ʒ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sjfa='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//���ʦ��Ʒ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sjfa='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and  crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;
	//���ʦ���ڷ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.hqfw='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//���ʦ���ڷ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.hqfw='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//���ʦ���ڷ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.hqfw='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//���ʦ���ڷ���-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.hqfw='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//���ʦ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.jdqk='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//���ʦ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.jdqk='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//���ʦ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.jdqk='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//���ʦ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.jdqk='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

//ʩ����===============================================================================================================================
	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//ʩ���ӷ���̬��-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.fwsz='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//ʩ���ӷ���̬��-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.fwsz='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//ʩ���ӷ���̬��-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.fwsz='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//ʩ���ӷ���̬��-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.fwsz='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//ʩ����ʩ������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sgzl='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//ʩ����ʩ������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sgzl='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//ʩ����ʩ������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sgzl='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//ʩ����ʩ������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.sgzl='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//ʩ���ӹ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.grsz='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//ʩ���ӹ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.grsz='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//ʩ���ӹ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.grsz='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//ʩ���ӹ�������-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.grsz='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

//�ʼ�Ա===========================================================================================================================
	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyfw='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyfw='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyfw='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyfw='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//�ʼ�Ա��λ-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjydw='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//�ʼ�Ա��λ-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjydw='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//�ʼ�Ա��λ-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjydw='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//�ʼ�Ա��λ-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjydw='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	sjsy=0;
	sjsyl=0;
	sjsyz=0;
	sjsyc=0;

	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyjz='21'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsy);
	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyjz='22'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyl);
	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyjz='23'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�;23���ڻط�22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyz);
	//�ʼ�Ա����-> �� 
	ls_sql=" select count(*) from crm_hfjl,crm_khxx where crm_khxx.khbh=crm_hfjl.khbh ";
	ls_sql+=" and crm_hfjl.zjyjz='24'";//(21:�� 22:�� 23:�� 24:�� )
	ls_sql+=" and crm_hfjl.hflxbm='24'";//24:�깤�ط�; 23���ڻط� 22:���ι��̻ط�
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if(rs.next())
	{
		sjsyc=rs.getInt(1);
	}
	rs.close();
	ps.close();
	data.add(sjsyc);

	int ybtscs=0;//һ��Ͷ��
	String bm="";
	String[] te=null;
	String tem="";
	ArrayList tl=new ArrayList();
	ArrayList yb=new ArrayList();
	int allts=0;
	int allyb=0;
//һ��Ͷ��(01:һ��;03:�ش�;lx:1)=========================================================================================================
	ls_sql=" select dwmc,sq_dwxx.dwbh,count(*) ss from crm_tsjl,crm_khxx,crm_tsbm,sq_dwxx where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_tsjl.yzcdbm='01'";//(01:һ��;03:�ش� )
	ls_sql+=" and crm_tsjl.lx='1' ";//Ͷ��
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql2;
	ls_sql+=" group by dwmc,sq_dwxx.dwbh ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		 te=te=new String[3];
		 tem="";
		 bm="";
		 bm=rs.getString("dwbh");
		
		te[0]=rs.getString("dwmc");//���β���
		te[1]=rs.getString("ss");//�ش�
		allts+=Integer.parseInt(te[1]);
		//2���ڴ���
		ls_sql=" select DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨ','2','�ڴ���','3','�ѽ��','δ֪ͨ') clzt,count(*) ss from crm_tsjl,crm_khxx,crm_tsbm,sq_dwxx where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsjl.yzcdbm='01'";//(01:һ��;03:�ش� )
		ls_sql+=" and crm_tsjl.lx='1' ";//Ͷ��
		ls_sql+=" and crm_tsbm.dwbh='"+bm+"' ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql2;
		ls_sql+=" group by crm_tsbm.clzt ";
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while(rs1.next())
		{
			tem=tem+rs1.getString("clzt");//0��δ֪ͨ��1����֪ͨδ����2���ڴ���3���ѽ��
			tem=tem+":"+rs1.getString("ss")+"&nbsp;";
		}
		rs1.close();
		ps1.close();

		te[2]=tem;
		yb.add(te);
		te=null;
	}
	rs.close();
	ps.close();
//�ش�==========================================================================================================================
	allts+=ybtscs;

	ls_sql=" select dwmc,sq_dwxx.dwbh,count(*) ss from crm_tsjl,crm_khxx,crm_tsbm,sq_dwxx where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_tsjl.yzcdbm='03'";//(01:һ��;03:�ش� )
	ls_sql+=" and crm_tsjl.lx='1' ";//Ͷ��
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql2;
	ls_sql+=" group by dwmc,sq_dwxx.dwbh ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		 te=te=new String[3];
		 tem="";
		 bm="";
		 bm=rs.getString("dwbh");
		
		te[0]=rs.getString("dwmc");//���β���
		te[1]=rs.getString("ss");//�ش�
		allts+=Integer.parseInt(te[1]);
		//2���ڴ���
		ls_sql=" select DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨ','2','�ڴ���','3','�ѽ��','δ֪ͨ') clzt,count(*) ss from crm_tsjl,crm_khxx,crm_tsbm,sq_dwxx where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsjl.yzcdbm='03'";//(01:һ��;03:�ش� )
		ls_sql+=" and crm_tsjl.lx='1' ";//Ͷ��
		ls_sql+=" and crm_tsbm.dwbh='"+bm+"' ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql2;
		ls_sql+=" group by crm_tsbm.clzt ";
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while(rs1.next())
		{
			tem=tem+rs1.getString("clzt");//0��δ֪ͨ��1����֪ͨδ����2���ڴ���3���ѽ��
			tem=tem+":"+rs1.getString("ss")+"&nbsp;";
		}
		rs1.close();
		ps1.close();

		te[2]=tem;
		tl.add(te);
		te=null;
	}
	rs.close();
	ps.close();

//����===========================================================================================================================
	ArrayList  bx=new ArrayList();
	int allbxs=0;
	ls_sql=" select crm_tsbm.tslxbm,tslxmc,count(*) ss from crm_tsjl,crm_khxx,crm_tsbm,dm_tslxbm where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+)";
	ls_sql+=" and crm_tsjl.lx='2' ";//����
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql2;
	ls_sql+=" group by crm_tsbm.tslxbm, tslxmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		te=new String[3];
		tem="";
		bm="";
		bm=rs.getString("tslxbm");
		te[0]=rs.getString("ss");
		
		te[1]=rs.getString("tslxmc");
		allbxs+=Integer.parseInt(te[0]);
		ls_sql=" select DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨ','2','�ڴ���','3','�ѽ��') clzt,count(*) ss from crm_tsjl,crm_khxx,crm_tsbm,dm_tslxbm where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+)";
		ls_sql+=" and crm_tsjl.lx='2' ";//����
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_tsbm.tslxbm='"+bm+"' ";
		//ls_sql+=" and crm_tsjl.clzt='3' ";//0��δ֪ͨ��1����֪ͨδ����2���ڴ���3���ѽ�� DECODE(clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��')
		ls_sql+=wheresql2;
		ls_sql+=" group by crm_tsbm.clzt";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while(rs1.next())
		{
			tem=tem+rs1.getString("clzt");//0��δ֪ͨ��1����֪ͨδ����2���ڴ���3���ѽ��
			tem=tem+":"+rs1.getString("ss")+"&nbsp;";
		}
		rs1.close();
		ps1.close();

		te[2]=tem;
		bx.add(te);
		te=null;
	}
	rs.close();
	ps.close();
//==================================================================================================================================
	%>
	<html>
	<head>
	<title>�ͷ�������</title>
	</head>
	<body>
	<CENTER style='FONT-SIZE: 14px;border-collapse:collapse'>
  <B>�ͷ�������</B><BR>
  (ʱ�䣺<%=qyrq%>--<%=qyrq2%>)<BR>
</CENTER>
<div align="right" style='FONT-SIZE: 14px;border-collapse:collapse'>����ǩ��:<%=xqds%>&nbsp;��&nbsp;&nbsp;</div>
<table width="100%" height="836" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999" style='FONT-SIZE: 12px;border-collapse:collapse'>
  <tr bgcolor="#CCCCCC" height="22">
    <td width="12%" rowspan="12" align="center" bgcolor="#FFFFFF">β�ô���:<%=wghfcs%></td>
<td  width="12%" align="center" rowspan="4">���ʦ��Ʒ���</td>
	<td  align="center">��</td><td  align="center"><%=data.get(0)%></td>	
	<%
	if((data.get(0)+data.get(1)+data.get(2)+data.get(3))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td>
	<%
	}
	else
	{
	%>
		<td ROWSPAN="4" align="center">������:<%=((data.get(0)+data.get(1))*100/(data.get(0)+data.get(1)+data.get(2)+data.get(3)))%>% <br>�ϸ���:<%=((data.get(0)+data.get(1)+data.get(2))*100/(data.get(0)+data.get(1)+data.get(2)+data.get(3)))%>%</td>
	<%
	}
	%>

	<td  width="12%" align="center" rowspan="4">���ʦ���ڷ���</td><td  align="center">��</td><td  align="center"><%=data.get(4)%></td>
	<%
	if((data.get(4)+data.get(5)+data.get(6)+data.get(7))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td>
	<%
	}
	else
	{
	%>
		<td ROWSPAN="4" align="center">������:<%=((data.get(4)+data.get(5))*100/(data.get(4)+data.get(5)+data.get(6)+data.get(7)))%>% <br>�ϸ���:<%=((data.get(4)+data.get(5)+data.get(7))*100/(data.get(4)+data.get(5)+data.get(6)+data.get(7)))%>%</td>
	<%
	}
	%>

	
	
	<td  width="12%" align="center" rowspan="4">���ʦ�������</td>

	<td  align="center">��</td><td  align="center"><%=data.get(8)%></td>	
	<%
	if((data.get(8)+data.get(9)+data.get(10)+data.get(11))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td></tr>
	<%
	}
	else
	{
	%>
		<td ROWSPAN="4" align="center">������:<%=((data.get(8)+data.get(9))*100/(data.get(8)+data.get(9)+data.get(10)+data.get(11)))%>% <br>�ϸ���:<%=((data.get(8)+data.get(9)+data.get(10))*100/(data.get(8)+data.get(9)+data.get(10)+data.get(11)))%>%</td></tr>
	<%
	}
	%>
	



<TR><td  align="center">��</td><td  align="center"><%=data.get(1)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(5)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(9)%></td></tr>
<TR><td  align="center">��</td><td  align="center"><%=data.get(2)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(6)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(10)%></td></tr>
<TR><td  align="center">��</td><td  align="center"><%=data.get(3)%>
</td><td  align="center">��</td><td  align="center"><%=data.get(7)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(11)%></td></tr>





<td  width="12%" align="center" rowspan="4">ʩ���ӷ���̬��</td>
	<td  align="center">��</td><td  align="center"><%=data.get(12)%></td>
	<%
	if((data.get(12)+data.get(13)+data.get(14)+data.get(15))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td>
	<%
	}
	else
	{
	%>
			<td ROWSPAN="4" align="center">������:<%=((data.get(12)+data.get(13))*100/(data.get(12)+data.get(13)+data.get(14)+data.get(15)))%>% <br>�ϸ���:<%=((data.get(12)+data.get(13)+data.get(14))*100/(data.get(12)+data.get(13)+data.get(14)+data.get(15)))%>%</td>
	<%
	}
	%>

	
	
	<td  width="12%" align="center" rowspan="4">ʩ����ʩ������</td>
	<td  align="center">��</td><td  align="center"><%=data.get(16)%></td>
	<%
	if((data.get(16)+data.get(17)+data.get(18)+data.get(19))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td>
	<%
	}
	else
	{
	%>
			<td ROWSPAN="4" align="center">������:<%=((data.get(16)+data.get(17))*100/(data.get(16)+data.get(17)+data.get(18)+data.get(19)))%>% <br>�ϸ���:<%=((data.get(16)+data.get(17)+data.get(18))*100/(data.get(16)+data.get(17)+data.get(18)+data.get(19)))%>%</td>
	<%
	}
	%>

	
	
	
	<td  width="12%" align="center" rowspan="4">ʩ���ӹ�������</td>
	<td  align="center">��</td><td  align="center"><%=data.get(20)%></td>
	<%
	if((data.get(20)+data.get(21)+data.get(22)+data.get(23))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td></tr>
	<%
	}
	else
	{
	%>
			<td ROWSPAN="4" align="center">������:<%=((data.get(20)+data.get(21))*100/(data.get(20)+data.get(21)+data.get(22)+data.get(23)))%>% <br>�ϸ���:<%=((data.get(20)+data.get(21)+data.get(22))*100/(data.get(20)+data.get(21)+data.get(22)+data.get(23)))%>%</td></tr>
	<%
	}
	%>
	
<TR><td  align="center">��</td><td  align="center"><%=data.get(13)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(17)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(21)%></td></tr>
<TR><td  align="center">��</td><td  align="center"><%=data.get(14)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(18)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(22)%></td></tr>
<TR><td  align="center">��</td><td  align="center"><%=data.get(15)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(19)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(23)%></td></tr>



<td  width="12%" align="center" rowspan="4">�ʼ�Ա����</td>
	<td  align="center">��</td><td  align="center"><%=data.get(24)%></td>
	
	<%
	if((data.get(24)+data.get(25)+data.get(26)+data.get(27))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td>
	<%
	}
	else
	{
	%>
			<td ROWSPAN="4" align="center">������:<%=((data.get(24)+data.get(25))*100/(data.get(24)+data.get(25)+data.get(26)+data.get(27)))%>% <br>�ϸ���:<%=((data.get(24)+data.get(25)+data.get(26))*100/(data.get(24)+data.get(25)+data.get(26)+data.get(27)))%>%</td>
	<%
	}
	%>
	
	<td  width="12%" align="center" rowspan="4">�ʼ�Ա��λ</td>
	<td  align="center">��</td><td  align="center"><%=data.get(28)%></td>
	
	<%
	if((data.get(28)+data.get(29)+data.get(30)+data.get(31))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td>
	<%
	}
	else
	{
	%>
			<td ROWSPAN="4" align="center">������:<%=((data.get(28)+data.get(29))*100/(data.get(28)+data.get(29)+data.get(30)+data.get(31)))%>% <br>�ϸ���:<%=((data.get(30)+data.get(28)+data.get(29))*100/(data.get(28)+data.get(29)+data.get(30)+data.get(31)))%>%</td>
	<%
	}
	%>
	
	<td  width="12%" align="center" rowspan="4">�ʼ�Ա����</td>
	<td  align="center" align="center">��</td><td  align="center"><%=data.get(32)%></td>	
	<%
	if((data.get(32)+data.get(33)+data.get(34)+data.get(35))==0)
	{
	%>
		<td ROWSPAN="4" align="center">������:0% <br>�ϸ���:0%</td></tr>
	<%
	}
	else
	{
	%>
			<td ROWSPAN="4" align="center">������:<%=((data.get(32)+data.get(33))*100/(data.get(32)+data.get(33)+data.get(34)+data.get(35)))%>% <br>�ϸ���:<%=((data.get(32)+data.get(33)+data.get(34))*100/(data.get(32)+data.get(33)+data.get(34)+data.get(35)))%>%</td></tr>
	<%
	}
	%>
	
<TR><td  align="center">��</td><td  align="center"><%=data.get(25)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(29)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(33)%></td></tr>
<TR><td  align="center">��</td><td  align="center"><%=data.get(26)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(30)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(34)%></td></tr>
<TR><td  align="center">��</td><td  align="center"><%=data.get(27)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(31)%></td>
<td  align="center">��</td><td  align="center"><%=data.get(35)%></td></tr>

<tr>
<%
	if((tl.size()+yb.size())==0)
	{
		out.print("<td align=\"center\" rowspan=\""+(tl.size()+4)+"\">");
	}
	else
	{
		out.print("<td align=\"center\" rowspan=\""+(tl.size()+3+yb.size())+"\">");
	}
%>
�ͻ�����(<%=allts%>)</td><td align="center">���</td><td align="center" colspan="3">���β���</td><td align="center">����</td><td colspan="7" align="center">��ע</td></tr>
<%
	if(yb.size()==0)
	{
%>
		<tr><TD rowspan="<%=yb.size()%>" align="center">��ͨ</td><td align="center" colspan="3">��</td><td align="center">��</td><td colspan="7" align="center"></td></tr>
<%
	}
	else
	{
%>
		<tr><TD rowspan="<%=yb.size()%>" align="center">��ͨ</td><td align="center" colspan="3"><%=((String[])(yb.get(0)))[0]%></td><td align="center"><%=((String[])(yb.get(0)))[1]%></td><td colspan="7" align="center"><%=((String[])(yb.get(0)))[2]%></td></tr>
<%
		for(int i=1;i<yb.size();i++)
		{
			out.print("<tr><td align=\"center\" colspan=\"3\">"+((String[])(yb.get(i)))[0]+"</td><td align=\"center\">"+((String[])(yb.get(i)))[1]+"</td><td colspan=\"7\" align=\"center\">"+((String[])(yb.get(i)))[2]+"</td></tr>");
		}
	}
	//out.print(bx.size());
%>	

<!--����===================================================================================================================== -->
<%
	if(tl.size()==0)
	{
%>
		<tr><TD rowspan="<%=tl.size()%>" align="center">����</td><td align="center" colspan="3">��</td><td align="center">��</td><td colspan="7" align="center"></td></tr>	
	<%
	}
	else
	{
	%>
		<tr><TD rowspan="<%=tl.size()%>" align="center">����</td><td align="center" colspan="3"><%=((String[])(tl.get(0)))[0]%></td><td align="center"><%=((String[])(tl.get(0)))[1]%></td><td colspan="7" align="center"><%=((String[])(tl.get(0)))[2]%></td></tr>
<%
		for(int i=1;i<tl.size();i++)
		{
			out.print("<tr><td align=\"center\" colspan=\"3\">"+((String[])(tl.get(i)))[0]+"</td><td align=\"center\">"+((String[])(tl.get(i)))[1]+"</td><td colspan=\"7\" align=\"center\">"+((String[])(tl.get(i)))[2]+"</td></tr>");
		}
	}
	//out.print(bx.size());
%>
<tr><td colspan="4" align="center">�����ֳ�</td><td align="center"><%=ALLkccs%></td><td colspan="7" align="center">
<%
for(int i=0;i<kc.size();i++)
{
	//out.print(((String[])kc.get(i))[0]+":"+((String[])kc.get(i))[1]+"&nbsp;&nbsp;");
}
%>


</td></tr>
<tr><td align="center" rowspan="<%=(bx.size()+1)%>">��װά��(<%=allbxs%>)<br>
      ά��׷��:(<%=bscs%>)</td><td align="center">���</td><td align="center" colspan="2">����</td><td colspan="9" align="center">��ע</td></tr>
<%
	for(int i=0;i<bx.size();i++)
	{
		out.print("<tr><td align=\"center\" >"+((String[])(bx.get(i)))[1]+"</td><td align=\"center\" colspan=\"2\">"+((String[])(bx.get(i)))[0]+"</td><td colspan=\"9\" align=\"center\">"+((String[])(bx.get(i)))[2]+"</td></tr>");
	}
	%>
<tr><td align="center">���ػص�</td><td colspan="12" align="center"><%=gdhds%>��</td></tr>
<tr><td align="center">С��</td>
    <td colspan="12"  height="205">&nbsp;</td>
  </tr>
<%
}
//===================================================================================================
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
	//yb.clear();
	//tl.clear();
}
%>

</table>
<br>
<div align="right" style='FONT-SIZE: 14px;border-collapse:collapse'><%=dwmc%>�ͷ���</div>

</body>
</html>


