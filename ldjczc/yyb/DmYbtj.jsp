<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170214'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[�±�]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[�±�]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int dmsl=0;
try {
	conn=cf.getConnection();

	ls_sql =" SELECT count(*)";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>����ҵ��ͳ�ƣ��±�</B><BR>
  <b>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="330%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" rowspan="2" >ʱ��</td>
  <td  width="5%" rowspan="2" >����</td>

  <td  width="2%" rowspan="2" ><font color="#FF0000">����</font></td>
  <td  width="2%" rowspan="2" ><font color="#FF0000">������</font></td>

  <td colspan="7" >��Ʒ�</td>
  <td colspan="7" >���Ի�</td>
  <td colspan="7" >�ײ�</td>
  <td  width="4%" rowspan="2" >���ɼҾ�</td>
  <td colspan="5" >�ϼ�</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" >����</td>
  <td  width="4%" >ʵ�����</td>
  <td  width="4%" >��˾�ƻ�</td>
  <td  width="2%" >��ɱ���</td>
  <td  width="4%" >���żƻ�</td>
  <td  width="2%" >��ɱ���</td>
  <td  width="3%" >�͵���</td>

  <td  width="2%" >����</td>
  <td  width="4%" >ʵ�����</td>
  <td  width="4%" >��˾�ƻ�</td>
  <td  width="2%" >��ɱ���</td>
  <td  width="4%" >���żƻ�</td>
  <td  width="2%" >��ɱ���</td>
  <td  width="3%" >�͵���</td>

  <td  width="2%" >����</td>
  <td  width="4%" >ʵ�����</td>
  <td  width="4%" >��˾�ƻ�</td>
  <td  width="2%" >��ɱ���</td>
  <td  width="4%" >���żƻ�</td>
  <td  width="2%" >��ɱ���</td>
  <td  width="3%" >�͵���</td>


  <td  width="5%" >�ϼ�</td>
  <td  width="5%" >��˾������</td>
  <td  width="2%" >����ɱ���</td>
  <td  width="5%" >����������</td>
  <td  width="2%" >����ɱ���</td>
  </tr>
<%

	int row=0;

	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	String sjfw_fd="";
	String sjfw2_fd="";




	String[] mons=cf.getMons(sjfw,sjfw2);
	int monsl=Integer.parseInt(mons[0]);
	for (int i=0;i<monsl;i++ )
	{
		sjfw_fd=mons[i*2+1];//�³�
		sjfw2_fd=mons[i*2+2];//��ĩ

		row=0;

		ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
		ls_sql+=" FROM sq_dwxx,sq_dwxx b";
		ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		if (!(fgs.equals("")))
		{
			ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
		}

		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
		ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			fgsmc=rs.getString("fgsmc");
			getdwbh=rs.getString("dwbh");
			dmmc=rs.getString("dwmc");
			cxbz=rs.getString("cxbz");
			kdsj=cf.fillNull(rs.getDate("kdsj"));
			gdsj=cf.fillNull(rs.getDate("gdsj"));

			if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
			{
				dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"��"+gdsj+")</font>";
			}
			else{
				if (!kdsj.equals(""))
				{
					dmmc=dmmc+"<BR>(����:"+kdsj+")";
				}
			}




			//�ƻ�
			int djsjh=0;
			double sjfjh=0;
			double gxhjh=0;
			double tcjh=0;
			double zcjh=0;
			double zjh=0;
			int jtdjsjh=0;
			double jtsjfjh=0;
			double jtgxhjh=0;
			double jttcjh=0;
			double jtzcjh=0;
			double jtzjh=0;
			ls_sql="select djsjh,sjfjh,gxhjh,tcjh,zcjh,zjh ";
			ls_sql+=" ,jtdjsjh,jtsjfjh,jtgxhjh,jttcjh,jtzcjh,jtzjh ";
			ls_sql+=" from  cw_jrbmyjkh";
			ls_sql+=" where dwbh='"+getdwbh+"'";
			ls_sql+=" and khqssj>=TO_DATE('"+cf.monFirst(sjfw2_fd)+"','YYYY-MM-DD')";
			ls_sql+=" and khjzsj<=TO_DATE('"+cf.monLastDate(sjfw2_fd)+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" order by khzq desc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				djsjh=rs1.getInt("djsjh");
				sjfjh=rs1.getDouble("sjfjh");
				gxhjh=rs1.getDouble("gxhjh");
				tcjh=rs1.getDouble("tcjh");
				zcjh=rs1.getDouble("zcjh");
				zjh=rs1.getDouble("zjh");
				jtdjsjh=rs1.getInt("jtdjsjh");
				jtsjfjh=rs1.getDouble("jtsjfjh");
				jtgxhjh=rs1.getDouble("jtgxhjh");
				jttcjh=rs1.getDouble("jttcjh");
				jtzcjh=rs1.getDouble("jtzcjh");
				jtzjh=rs1.getDouble("jtzjh");
			}
			rs1.close();
			ps1.close();



			//����
			int rdkhs=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx ";
			ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				rdkhs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			

			//������
			int djs=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx ";
			ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";

			ls_sql+=" and (  ";
			ls_sql+=" (  ";
			ls_sql+="     crm_zxkhxx.lfdjbz='Y'";//N��δ������Y���ѽ�����T���˶���
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.lfdj>0";
			ls_sql+=" )  ";

			ls_sql+=" OR  ";

			ls_sql+=" (  ";
			ls_sql+="     crm_zxkhxx.hddjbz='Y'";//N��δ������Y���ѽ�����T���˶���
			ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.hddj>0";
			ls_sql+=" )  ";

			ls_sql+=" )  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				djs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			
			
			//ʵ����Ʒ�
			int sjfkhs=0;
			double sjf=0;
			double sjhtje=0;
			long fwmj=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,sum(cw_khfkjl.fkje) sjf,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53����Ʒ�
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sjfkhs=rs1.getInt("khsl");
				sjf=rs1.getDouble("sjf");
				sjhtje=rs1.getDouble("sjhtje");
				fwmj=rs1.getLong("fwmj");
			}
			rs1.close();
			ps1.close();
			


			
			//���-�͵���
			int sjpjde=0;
			if (sjfkhs==0)
			{
				sjpjde=0;
			}
			else{
				sjpjde=(int)(sjf/sjfkhs);
			}
			
			//��˾���-��ɱ���
			double sjfwcbl=0;
			if (sjfjh==0)
			{
				sjfwcbl=0;
			}
			else{
				sjfwcbl=cf.round(sjf*100.0/sjfjh,2);
			}
			
			//�������-��ɱ���
			double jtsjfwcbl=0;
			if (jtsjfjh==0)
			{
				jtsjfwcbl=0;
			}
			else{
				jtsjfwcbl=cf.round(sjf*100.0/jtsjfjh,2);
			}

			//���Ի�
			int gxhkhs=0;
			double gxhje=0;
			ls_sql =" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='1' ";
			ls_sql+=" and crm_khxx.zt in('2','3','5')";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gxhkhs=rs1.getInt(1);
				gxhje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();
			
			//���Ի��˵�
			int tdgxhkhs=0;
			double tdgxhje=0;
			ls_sql=" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='1' ";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//�״θ���װ��ʱ��
			ls_sql+=" and crm_khxx.yjjzsj is not null ";//�״θ���װ��ʱ��
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tdgxhkhs=rs1.getInt(1);
				tdgxhje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			gxhje=gxhje-tdgxhje;


			
			//���Ի�-�͵���
			int gxhpjde=0;
			if (gxhkhs==0)
			{
				gxhpjde=0;
			}
			else{
				gxhpjde=(int)(gxhje/gxhkhs);
			}
			
			//��˾���Ի�-��ɱ���
			double gxhwcbl=0;
			if (gxhjh==0)
			{
				gxhwcbl=0;
			}
			else{
				gxhwcbl=cf.round(gxhje*100.0/gxhjh,2);
			}
			
			//���Ÿ��Ի�-��ɱ���
			double jtgxhwcbl=0;
			if (jtgxhjh==0)
			{
				jtgxhwcbl=0;
			}
			else{
				jtgxhwcbl=cf.round(gxhje*100.0/jtgxhjh,2);
			}



			//�ײ�
			int tckhs=0;
			double tcje=0;
			ls_sql =" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='2' ";
			ls_sql+=" and crm_khxx.zt in('2','3','5')";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tckhs=rs1.getInt(1);
				tcje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();
			
			//�ײ��˵�
			int tdtckhs=0;
			double tdtcje=0;
			ls_sql=" SELECT count(*),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
			ls_sql+=" and bdm_bjjbbm.lx='2' ";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//�״θ���װ��ʱ��
			ls_sql+=" and crm_khxx.yjjzsj is not null ";//�״θ���װ��ʱ��
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tdtckhs=rs1.getInt(1);
				tdtcje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			tcje=tcje-tdtcje;

			
			//�ײ�-�͵���
			int tcpjde=0;
			if (tckhs==0)
			{
				tcpjde=0;
			}
			else{
				tcpjde=(int)(tcje/tckhs);
			}
			
			//��˾�ײ�-��ɱ���
			double tcwcbl=0;
			if (tcjh==0)
			{
				tcwcbl=0;
			}
			else{
				tcwcbl=cf.round(tcje*100.0/tcjh,2);
			}
			
			//�����ײ�-��ɱ���
			double jttcwcbl=0;
			if (jttcjh==0)
			{
				jttcwcbl=0;
			}
			else{
				jttcwcbl=cf.round(tcje*100.0/jttcjh,2);
			}
			
			//���ɼҾ�
			double zcje=0;
			ls_sql =" SELECT sum(cw_khfkjl.fkje) yjje";
			ls_sql+=" FROM cw_khfkjl";

			ls_sql+=" where cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.dwbh='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw_fd+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2_fd+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcje=rs1.getDouble("yjje");
			}
			rs1.close();
			ps1.close();


			//��˾����ɱ���
			double zwcbl=0;
			if (zjh==0)
			{
				zwcbl=0;
			}
			else{
				zwcbl=cf.round((sjf+gxhje+tcje+zcje)*100.0/zjh,2);
			}
			
			//��������ɱ���
			double jtzwcbl=0;
			if (jtzjh==0)
			{
				jtzwcbl=0;
			}
			else{
				jtzwcbl=cf.round((sjf+gxhje+tcje+zcje)*100.0/jtzjh,2);
			}


			row++;

			%>
			<%
				if (row==1)
				{
					%>
					<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						<td align="center" rowspan="<%=dmsl%>">���ۼ�:<BR><%=sjfw_fd%><BR>��<BR><%=sjfw2_fd%></td>
					<%
				}
				else{
					%>
					<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<%
				}
			%>
				<td align="center"><%=dmmc%></td>

				<td>
					<A HREF="ViewDmRdkhMx.jsp?sjfw=<%=sjfw_fd%>&sjfw2=<%=sjfw2_fd%>&dwbh=<%=getdwbh%>" target="_blank"><%=rdkhs%></A>				
				</td>
				<td>
					<A HREF="ViewDjkhMx.jsp?sjfw=<%=sjfw_fd%>&sjfw2=<%=sjfw2_fd%>&dwbh=<%=getdwbh%>" target="_blank"><%=djs%></A>				
				</td>


				<td>
					<A HREF="/ldjczc/cztj/sjf/ViewDmsjfMx.jsp?sjfw=<%=sjfw_fd%>&sjfw2=<%=sjfw2_fd%>&dwbh=<%=getdwbh%>" target="_blank"><%=sjfkhs%></A>				
				</td>
				<td><%=cf.formatDouble(sjf)%></td>
				<td><%=cf.formatDouble(sjfjh)%></td>
				<td><%=sjfwcbl%>%</td>
				<td><%=cf.formatDouble(jtsjfjh)%></td>
				<td><%=jtsjfwcbl%>%</td>
				<td><%=cf.formatDouble(sjpjde)%></td>

				<td>
					<A HREF="/ldjczc/cztj/zhtj/ViewDmGxhYjMx.jsp?sjfw=<%=sjfw_fd%>&sjfw2=<%=sjfw2_fd%>&dwbh=<%=getdwbh%>" target="_blank"><%=gxhkhs%></A>				
				</td>
				<td><%=cf.formatDouble(gxhje)%></td>
				<td><%=cf.formatDouble(gxhjh)%></td>
				<td><%=gxhwcbl%>%</td>
				<td><%=cf.formatDouble(jtgxhjh)%></td>
				<td><%=jtgxhwcbl%>%</td>
				<td><%=cf.formatDouble(gxhpjde)%></td>

				<td>
					<A HREF="/ldjczc/cztj/zhtj/ViewDmTcYjMx.jsp?sjfw=<%=sjfw_fd%>&sjfw2=<%=sjfw2_fd%>&dwbh=<%=getdwbh%>" target="_blank"><%=tckhs%></A>				
				</td>
				<td><%=cf.formatDouble(tcje)%></td>
				<td><%=cf.formatDouble(tcjh)%></td>
				<td><%=tcwcbl%>%</td>
				<td><%=cf.formatDouble(jttcjh)%></td>
				<td><%=jttcwcbl%>%</td>
				<td><%=cf.formatDouble(tcpjde)%></td>

				<td>
					<A HREF="/ldjczc/cztj/zhtj/ViewDmJcMx.jsp?sjfw=<%=sjfw_fd%>&sjfw2=<%=sjfw2_fd%>&dwbh=<%=getdwbh%>" target="_blank"><%=zcje%></A>				
				</td>

				<td><%=cf.formatDouble((sjf+gxhje+tcje+zcje))%></td>
				<td><%=cf.formatDouble(zjh)%></td>
				<td><%=zwcbl%>%</td>
				<td><%=cf.formatDouble(jtzjh)%></td>
				<td><%=jtzwcbl%>%</td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}





	//�ϼƣ�����������������������������ʼ

	int xjrdkhs=0;
	int xjdjs=0;

	int xjsjfkhs=0;
	double xjsjf=0;

	double xjdjsjh=0;
	double xjsjfjh=0;
	double xjgxhjh=0;
	double xjtcjh=0;
	double xjzcjh=0;
	double xjzjh=0;

	double xjjtdjsjh=0;
	double xjjtsjfjh=0;
	double xjjtgxhjh=0;
	double xjjttcjh=0;
	double xjjtzcjh=0;
	double xjjtzjh=0;

	int xjgxhkhs=0;
	double xjgxhje=0;

	int xjtckhs=0;
	double xjtcje=0;

	double xjzcje=0;

	row=0;

	ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");
		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));

		if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
		{
			dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"��"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				dmmc=dmmc+"<BR>(����:"+kdsj+")";
			}
		}




		//�ƻ�
		int djsjh=0;
		double sjfjh=0;
		double gxhjh=0;
		double tcjh=0;
		double zcjh=0;
		double zjh=0;
		int jtdjsjh=0;
		double jtsjfjh=0;
		double jtgxhjh=0;
		double jttcjh=0;
		double jtzcjh=0;
		double jtzjh=0;
		ls_sql="select sum(djsjh) djsjh,sum(sjfjh) sjfjh,sum(gxhjh) gxhjh,sum(tcjh) tcjh,sum(zcjh) zcjh,sum(zjh) zjh";
		ls_sql+=" ,sum(jtdjsjh) jtdjsjh,sum(jtsjfjh) jtsjfjh,sum(jtgxhjh) jtgxhjh,sum(jttcjh) jttcjh,sum(jtzcjh) jtzcjh,sum(jtzjh) jtzjh";
		ls_sql+=" from  cw_jrbmyjkh";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ls_sql+=" and khqssj>=TO_DATE('"+cf.monFirst(sjfw)+"','YYYY-MM-DD')";
		ls_sql+=" and khjzsj<=TO_DATE('"+cf.monLastDate(sjfw2)+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" order by khzq desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			djsjh=rs1.getInt("djsjh");
			sjfjh=rs1.getDouble("sjfjh");
			gxhjh=rs1.getDouble("gxhjh");
			tcjh=rs1.getDouble("tcjh");
			zcjh=rs1.getDouble("zcjh");
			zjh=rs1.getDouble("zjh");
			jtdjsjh=rs1.getInt("jtdjsjh");
			jtsjfjh=rs1.getDouble("jtsjfjh");
			jtgxhjh=rs1.getDouble("jtgxhjh");
			jttcjh=rs1.getDouble("jttcjh");
			jtzcjh=rs1.getDouble("jtzcjh");
			jtzjh=rs1.getDouble("jtzjh");
		}
		rs1.close();
		ps1.close();

		xjdjsjh+=djsjh;
		xjsjfjh+=sjfjh;
		xjgxhjh+=gxhjh;
		xjtcjh+=tcjh;
		xjzcjh+=zcjh;
		xjzjh+=zjh;

		xjjtdjsjh+=jtdjsjh;
		xjjtsjfjh+=jtsjfjh;
		xjjtgxhjh+=jtgxhjh;
		xjjttcjh+=jttcjh;
		xjjttcjh=cf.round(xjjttcjh,2);
		xjjtzcjh+=jtzcjh;
		xjjtzcjh=cf.round(xjjtzcjh,2);
		xjjtzjh+=jtzjh;
		xjjtzjh=cf.round(xjjtzjh,2);


		//����
		int rdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		xjrdkhs+=rdkhs;

		//������
		int djs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";

		ls_sql+=" and (  ";
		ls_sql+=" (  ";
		ls_sql+="     crm_zxkhxx.lfdjbz='Y'";//N��δ������Y���ѽ�����T���˶���
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdj>0";
		ls_sql+=" )  ";

		ls_sql+=" OR  ";

		ls_sql+=" (  ";
		ls_sql+="     crm_zxkhxx.hddjbz='Y'";//N��δ������Y���ѽ�����T���˶���
		ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddj>0";
		ls_sql+=" )  ";

		ls_sql+=" )  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			djs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		xjdjs+=djs;
		
		
		//ʵ����Ʒ�
		int sjfkhs=0;
		double sjf=0;
		double sjhtje=0;
		long fwmj=0;
		ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,sum(cw_khfkjl.fkje) sjf,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
		ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
		ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

		ls_sql+=" and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53����Ʒ�
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfkhs=rs1.getInt("khsl");
			sjf=rs1.getDouble("sjf");
			sjhtje=rs1.getDouble("sjhtje");
			fwmj=rs1.getLong("fwmj");
		}
		rs1.close();
		ps1.close();
		

		xjsjfkhs+=sjfkhs;
		xjsjf+=sjf;

		
		//���-�͵���
		int sjpjde=0;
		if (sjfkhs==0)
		{
			sjpjde=0;
		}
		else{
			sjpjde=(int)(sjf/sjfkhs);
		}
		
		//��˾���-��ɱ���
		double sjfwcbl=0;
		if (sjfjh==0)
		{
			sjfwcbl=0;
		}
		else{
			sjfwcbl=cf.round(sjf*100.0/sjfjh,2);
		}
		
		//�������-��ɱ���
		double jtsjfwcbl=0;
		if (jtsjfjh==0)
		{
			jtsjfwcbl=0;
		}
		else{
			jtsjfwcbl=cf.round(sjf*100.0/jtsjfjh,2);
		}

		//���Ի�
		int gxhkhs=0;
		double gxhje=0;
		ls_sql =" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1' ";
		ls_sql+=" and crm_khxx.zt in('2','3','5')";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gxhkhs=rs1.getInt(1);
			gxhje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//���Ի��˵�
		int tdgxhkhs=0;
		double tdgxhje=0;
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1' ";
		ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdgxhkhs=rs1.getInt(1);
			tdgxhje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		gxhje=gxhje-tdgxhje;

		xjgxhkhs+=gxhkhs;
		xjgxhje+=gxhje;

		
		//���Ի�-�͵���
		int gxhpjde=0;
		if (gxhkhs==0)
		{
			gxhpjde=0;
		}
		else{
			gxhpjde=(int)(gxhje/gxhkhs);
		}
		
		//��˾���Ի�-��ɱ���
		double gxhwcbl=0;
		if (gxhjh==0)
		{
			gxhwcbl=0;
		}
		else{
			gxhwcbl=cf.round(gxhje*100.0/gxhjh,2);
		}
		
		//���Ÿ��Ի�-��ɱ���
		double jtgxhwcbl=0;
		if (jtgxhjh==0)
		{
			jtgxhwcbl=0;
		}
		else{
			jtgxhwcbl=cf.round(gxhje*100.0/jtgxhjh,2);
		}



		//�ײ�
		int tckhs=0;
		double tcje=0;
		ls_sql =" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='2' ";
		ls_sql+=" and crm_khxx.zt in('2','3','5')";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tckhs=rs1.getInt(1);
			tcje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//�ײ��˵�
		int tdtckhs=0;
		double tdtcje=0;
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='2' ";
		ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.yjjzsj is not null ";//�״θ���װ��ʱ��
		ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdtckhs=rs1.getInt(1);
			tdtcje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		tcje=tcje-tdtcje;

		xjtckhs+=tckhs;
		xjtcje+=tcje;
		
		//�ײ�-�͵���
		int tcpjde=0;
		if (tckhs==0)
		{
			tcpjde=0;
		}
		else{
			tcpjde=(int)(tcje/tckhs);
		}
		
		//��˾�ײ�-��ɱ���
		double tcwcbl=0;
		if (tcjh==0)
		{
			tcwcbl=0;
		}
		else{
			tcwcbl=cf.round(tcje*100.0/tcjh,2);
		}
		
		//�����ײ�-��ɱ���
		double jttcwcbl=0;
		if (jttcjh==0)
		{
			jttcwcbl=0;
		}
		else{
			jttcwcbl=cf.round(tcje*100.0/jttcjh,2);
		}
		
		//���ɼҾ�
		double zcje=0;
		ls_sql =" SELECT sum(cw_khfkjl.fkje) yjje";
		ls_sql+=" FROM cw_khfkjl";

		ls_sql+=" where cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and cw_khfkjl.dwbh='"+getdwbh+"'";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcje=rs1.getDouble("yjje");
		}
		rs1.close();
		ps1.close();

		xjzcje+=zcje;


		//��˾����ɱ���
		double zwcbl=0;
		if (zjh==0)
		{
			zwcbl=0;
		}
		else{
			zwcbl=cf.round((sjf+gxhje+tcje+zcje)*100.0/zjh,2);
		}
		
		//��������ɱ���
		double jtzwcbl=0;
		if (jtzjh==0)
		{
			jtzwcbl=0;
		}
		else{
			jtzwcbl=cf.round((sjf+gxhje+tcje+zcje)*100.0/jtzjh,2);
		}


		row++;

		%>
		<%
			if (row==1)
			{
				%>
				<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td align="center" rowspan="<%=dmsl%>">�ϼ�:<BR><%=sjfw%><BR>��<BR><%=sjfw2%></td>
				<%
			}
			else{
				%>
				<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<%
			}
		%>
			<td align="center"><%=dmmc%></td>

			<td>
				<A HREF="ViewDmRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=rdkhs%></A>				
			</td>
			<td>
				<A HREF="ViewDjkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=djs%></A>				
			</td>


			<td>
				<A HREF="/ldjczc/cztj/sjf/ViewDmsjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=sjfkhs%></A>				
			</td>
			<td><%=cf.formatDouble(sjf)%></td>
			<td><%=cf.formatDouble(sjfjh)%></td>
			<td><%=sjfwcbl%>%</td>
			<td><%=cf.formatDouble(jtsjfjh)%></td>
			<td><%=jtsjfwcbl%>%</td>
			<td><%=cf.formatDouble(sjpjde)%></td>

			<td>
				<A HREF="/ldjczc/cztj/zhtj/ViewDmGxhYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=gxhkhs%></A>				
			</td>
			<td><%=cf.formatDouble(gxhje)%></td>
			<td><%=cf.formatDouble(gxhjh)%></td>
			<td><%=gxhwcbl%>%</td>
			<td><%=cf.formatDouble(jtgxhjh)%></td>
			<td><%=jtgxhwcbl%>%</td>
			<td><%=cf.formatDouble(gxhpjde)%></td>

			<td>
				<A HREF="/ldjczc/cztj/zhtj/ViewDmTcYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=tckhs%></A>				
			</td>
			<td><%=cf.formatDouble(tcje)%></td>
			<td><%=cf.formatDouble(tcjh)%></td>
			<td><%=tcwcbl%>%</td>
			<td><%=cf.formatDouble(jttcjh)%></td>
			<td><%=jttcwcbl%>%</td>
			<td><%=cf.formatDouble(tcpjde)%></td>

			<td>
				<A HREF="/ldjczc/cztj/zhtj/ViewDmJcMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=zcje%></A>				
			</td>

			<td><%=cf.formatDouble((sjf+gxhje+tcje+zcje))%></td>
			<td><%=cf.formatDouble(zjh)%></td>
			<td><%=zwcbl%>%</td>
			<td><%=cf.formatDouble(jtzjh)%></td>
			<td><%=jtzwcbl%>%</td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();


	//���-�͵���
	int sjpjde=0;
	if (xjsjfkhs==0)
	{
		sjpjde=0;
	}
	else{
		sjpjde=(int)(xjsjf/xjsjfkhs);
	}
	
	//��˾���-��ɱ���
	double sjfwcbl=0;
	if (xjsjfjh==0)
	{
		sjfwcbl=0;
	}
	else{
		sjfwcbl=cf.round(xjsjf*100.0/xjsjfjh,2);
	}
	
	//�������-��ɱ���
	double jtsjfwcbl=0;
	if (xjjtsjfjh==0)
	{
		jtsjfwcbl=0;
	}
	else{
		jtsjfwcbl=cf.round(xjsjf*100.0/xjjtsjfjh,2);
	}
		
	//���Ի�-�͵���
	int gxhpjde=0;
	if (xjgxhkhs==0)
	{
		gxhpjde=0;
	}
	else{
		gxhpjde=(int)(xjgxhje/xjgxhkhs);
	}
	
	//��˾���Ի�-��ɱ���
	double gxhwcbl=0;
	if (xjgxhjh==0)
	{
		gxhwcbl=0;
	}
	else{
		gxhwcbl=cf.round(xjgxhje*100.0/xjgxhjh,2);
	}
	
	//���Ÿ��Ի�-��ɱ���
	double jtgxhwcbl=0;
	if (xjjtgxhjh==0)
	{
		jtgxhwcbl=0;
	}
	else{
		jtgxhwcbl=cf.round(xjgxhje*100.0/xjjtgxhjh,2);
	}
	
	//�ײ�-�͵���
	int tcpjde=0;
	if (xjtckhs==0)
	{
		tcpjde=0;
	}
	else{
		tcpjde=(int)(xjtcje/xjtckhs);
	}
	
	//��˾���Ի�-��ɱ���
	double tcwcbl=0;
	if (xjtcjh==0)
	{
		tcwcbl=0;
	}
	else{
		tcwcbl=cf.round(xjtcje*100.0/xjtcjh,2);
	}
	
	//���Ÿ��Ի�-��ɱ���
	double jttcwcbl=0;
	if (xjjttcjh==0)
	{
		jttcwcbl=0;
	}
	else{
		jttcwcbl=cf.round(xjtcje*100.0/xjjttcjh,2);
	}
	
	//��˾����ɱ���
	double zwcbl=0;
	if (xjzjh==0)
	{
		zwcbl=0;
	}
	else{
		zwcbl=cf.round((xjsjf+xjgxhje+xjtcje+xjzcje)*100.0/xjzjh,2);
	}
	
	//��������ɱ���
	double jtzwcbl=0;
	if (xjjtzjh==0)
	{
		jtzwcbl=0;
	}
	else{
		jtzwcbl=cf.round((xjsjf+xjgxhje+xjtcje+xjzcje)*100.0/xjjtzjh,2);
	}

%>
<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="2"><B>�� ��</B></td>

	<td><B><%=xjrdkhs%></B></td>
	<td><B><%=xjdjs%></B></td>


	<td><B><%=xjsjfkhs%></B></td>
	<td><B><%=cf.formatDouble(xjsjf)%></B></td>
	<td><B><%=cf.formatDouble(xjsjfjh)%></B></td>
	<td><%=sjfwcbl%>%</td>
	<td><B><%=cf.formatDouble(xjjtsjfjh)%></B></td>
	<td><%=jtsjfwcbl%>%</td>
	<td><%=cf.formatDouble(sjpjde)%></td>


	<td><B><%=xjgxhkhs%></B></td>
	<td><B><%=cf.formatDouble(xjgxhje)%></B></td>
	<td><B><%=cf.formatDouble(xjgxhjh)%></B></td>
	<td><%=gxhwcbl%>%</td>
	<td><B><%=cf.formatDouble(xjjtgxhjh)%></B></td>
	<td><%=jtgxhwcbl%>%</td>
	<td><%=cf.formatDouble(gxhpjde)%></td>

	<td><%=xjtckhs%></td>
	<td><%=cf.formatDouble(xjtcje)%></td>
	<td><%=cf.formatDouble(xjtcjh)%></td>
	<td><%=tcwcbl%>%</td>
	<td><%=cf.formatDouble(xjjttcjh)%></td>
	<td><%=jttcwcbl%>%</td>
	<td><%=cf.formatDouble(tcpjde)%></td>

	<td><%=cf.formatDouble(xjzcje)%></td>

	<td><%=cf.formatDouble((xjsjf+xjgxhje+xjtcje+xjzcje))%></td>
	<td><%=cf.formatDouble(xjzjh)%></td>
	<td><%=zwcbl%>%</td>
	<td><%=cf.formatDouble(xjjtzjh)%></td>
	<td><%=jtzwcbl%>%</td>
</tr>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 