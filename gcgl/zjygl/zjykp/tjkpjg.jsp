<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=request.getParameter("kpjlh");
String kpfgs=request.getParameter("kpfgs");
String qssj=request.getParameter("qssj");
String jzsj=request.getParameter("jzsj");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String zjxm=null;

int jcf=0;//������
int xjykf=0;//Ѳ��Ա�۷�
int gscckf=0;//��˾���۷�
int gchfdf=0;//���̻طõ÷�
int tssgdkf=0;//Ͷ��ʩ���ӿ۷�
int tszjkf=0;//Ͷ�߹��̵����۷�
int bxkf=0;//���޿۷�
int zf=0;//�ܷ�
int bqpm=0;//��������

try {
	conn=cf.getConnection();
	
	//ɾ�������̵������ֱ�kp_zjpfb��
	ls_sql=" delete from kp_zjpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ȡ���̵���
	ls_sql=" insert into kp_zjpfb (kpjlh,zjxm,jcf,xjykf,gscckf,gchfdf,tssgdkf,tszjkf,bxkf,zf,bqpm) ";
	ls_sql+=" select "+kpjlh+",yhmc,0,0,0,0,0,0,0,0,0";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where zwbm='05' and dwbh in(select dwbh from sq_dwxx where ssfgs='"+kpfgs+"')";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql=" select zjxm";
	ls_sql+=" from  kp_zjpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		zjxm=rs1.getString("zjxm");

		jcf=500;
		
		
		//Ѳ��Ա�۷�
		ls_sql=" select sum(kp_kpkfbm.kfs)";
		ls_sql+=" from  kp_xjgdjl,crm_khxx,kp_xjgdmx,kp_kpkfbm";
		ls_sql+=" where kp_xjgdjl.xjjlh=kp_xjgdmx.xjjlh";//
		ls_sql+=" and kp_xjgdmx.kpkfbm=kp_kpkfbm.kpkfbm and kp_kpkfbm.kflx='1'";//1���۷֣�2��ĳ�����Ϊ0 
		ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm='2' ";//2:Ѳ��Ա,01:ʩ������
		ls_sql+=" and kp_xjgdjl.lrsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and kp_xjgdjl.lrsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjykf=rs.getInt(1);
		}
		else{
			xjykf=0;
		}
		rs.close();
		ps.close();

		//��˾��������۷�
		ls_sql=" select sum(kp_kpkfbm.kfs)";
		ls_sql+=" from  kp_xjgdjl,crm_khxx,kp_xjgdmx,kp_kpkfbm";
		ls_sql+=" where kp_xjgdjl.xjjlh=kp_xjgdmx.xjjlh";//
		ls_sql+=" and kp_xjgdmx.kpkfbm=kp_kpkfbm.kpkfbm and kp_kpkfbm.kflx='1'";//1���۷֣�2��ĳ�����Ϊ0 
		ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm='3' ";//3:��˾���,01:ʩ������
		ls_sql+=" and kp_xjgdjl.lrsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and kp_xjgdjl.lrsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gscckf=rs.getInt(1);
		}
		else{
			gscckf=0;
		}
		rs.close();
		ps.close();


		//�깤�طõ÷�
		ls_sql=" select DECODE(zjyfw,'21',10,'22',0,'23',-20)+DECODE(zjydw,'21',10,'22',0,'23',-20)+DECODE(zjyjz,'21',10,'22',0,'23',-20)";
		ls_sql+=" from  crm_hfjl,crm_khxx";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh and crm_hfjl.hflxbm='24'";//24���깤�ط�
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gchfdf=rs.getInt(1);
		}
		else{
			gchfdf=0;
		}
		rs.close();
		ps.close();


		ls_sql=" select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and lx='1' and crm_tsbm.tsxlbm='2101'";//2101:ʩ����
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tssgdkf=rs.getInt(1);//Ͷ��ʩ���ӿ۷�
		}
		else{
			tssgdkf=0;
		}
		rs.close();
		ps.close();

		tssgdkf=tssgdkf*20;

		ls_sql=" select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.lx='1' and crm_tsbm.tsxlbm='2102'";//2102:���̵���
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tszjkf=rs.getInt(1);//Ͷ�߹��̵����۷�
		}
		else{
			tszjkf=0;
		}
		rs.close();
		ps.close();

		tszjkf=tszjkf*50;

		//���޿۷�
		ls_sql=" select sum(dm_tsyybm.zjkf)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm,dm_tsyybm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		ls_sql+=" and crm_tsjl.lx='2' and crm_tsbm.tslxbm='11'";//11:���̱���
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			bxkf=rs.getInt(1);//���޿۷�
		}
		else{
			bxkf=0;
		}
		rs.close();
		ps.close();

		
		//����÷�
		ls_sql=" update kp_zjpfb set jcf=?,xjykf=?,gscckf=?,gchfdf=?,tssgdkf=?,tszjkf=?,bxkf=?";
		ls_sql+=" where zjxm='"+zjxm+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jcf);
		ps.setInt(2,xjykf);
		ps.setInt(3,gscckf);
		ps.setInt(4,gchfdf);
		ps.setInt(5,tssgdkf);
		ps.setInt(6,tszjkf);
		ps.setInt(7,bxkf);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


	//�����ܷ�
	ls_sql=" update kp_zjpfb set zf=jcf-xjykf-gscckf+gchfdf-tssgdkf-tszjkf-bxkf";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�ܷ�����

	int oldzf=0;//�ܷ�
	ls_sql=" select zjxm,zf";
	ls_sql+=" from  kp_zjpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ls_sql+=" order by zf desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		zjxm=rs1.getString("zjxm");
		zf=rs1.getInt("zf");

		if (zf!=oldzf)
		{
			bqpm++;
			oldzf=zf;
		}

		//�����ܷ�����
		ls_sql=" update kp_zjpfb set bqpm=?";
		ls_sql+=" where zjxm='"+zjxm+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,bqpm);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>