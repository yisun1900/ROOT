<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String wheresql="";
String sjfw=null;
String sjfw2=null;



String fgs=request.getParameter("fgs");
if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_tsjl.ssfgs='"+fgs+"')";
}

String dwbh=request.getParameter("dwbh");
if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_tsjl.slbm='"+dwbh+"'";
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

String yzcdbm=null;
String yzcdmc=null;
String tsjlh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String qydm=null;
String zjy=null;
String sgd=null;
String tslxmc=null;
String tsxlmc=null;
String tsyymc=null;
String slfsmc=null;
String slsj=null;
String slr=null;
String jazt=null;
String zrbm=null;
String slbm=null;
String tsnr=null;
String bz=null;

String clqk=null;
String lrsj=null;
String lrr=null;

String yhmc=null;
String hfr=null;
String hfsj=null;
String hfjgmc=null;
String khhfqk=null;
String cxxwt=null;

int lstscs=0;
int lssmcs=0;
int wjacs=0;

String bgcolor=null;

int count=0;

int row=0;

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE17 {font-family: "����_GB2312"; font-weight: bold; font-size: 14px; color: #990000; }
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>δ�᰸Ͷ�߱���</B>
</CENTER>
<%

//Ͷ�����س̶ȱ��룬01����΢Υ�£�02������Υ�£�03���ر�����
ls_sql=" SELECT khbh,count(*) wjacs";
ls_sql+=" from crm_tsjl";
ls_sql+=" where lx='1' and clzt in('1','2')";//1��Ͷ�ߣ�2������
ls_sql+=" and  crm_tsjl.clzt in('0','1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
ls_sql+=wheresql;
ls_sql+=" group by khbh";
ls_sql+=" order by wjacs desc";
//out.println(ls_sql);
ps2= conn.prepareStatement(ls_sql);
rs2 =ps2.executeQuery();
while (rs2.next())
{
	khbh=rs2.getString("khbh");
	wjacs=rs2.getInt("wjacs");//Ŀǰδ�᰸

	ls_sql="SELECT khbh,crm_khxx.khxm||'('||crm_khxx.lxfs||')' khxm";
	ls_sql+=" ,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,dwmc,sgdmc sgd";
	ls_sql+=" FROM crm_khxx,sq_dwxx ,sq_sgd  ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjy=cf.fillNull(rs.getString("zjxm"));
		qydm=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
	ps.close();


	//�ۼ�Ͷ�߱���
	ls_sql=" SELECT count(*) lstscs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"'";
	ls_sql+=" and lx='1' and clzt!='9'";//1��Ͷ�ߣ�2������
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		lstscs=rs1.getInt("lstscs");
	}
	rs1.close();
	ps1.close();
		
	//��������
	ls_sql=" SELECT count(*) lssmcs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"' and slfsbm='3'";//3:����
	ls_sql+=" and lx='1' and clzt!='9'";//1��Ͷ�ߣ�2������
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		lssmcs=rs1.getInt("lssmcs");
	}
	rs1.close();
	ps1.close();
		
		
	row++;

	if (row%2==0)
	{
		bgcolor="#E8E8FF";
	}
	else{
		bgcolor="#FFFFFF";
	}
	%> 
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
  <tr> 
    <td align="center" rowspan="<%=(2+wjacs)%>" width="3%"><%=row%></td>
    <td colspan="4" height="50"> 
      <table width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
        <tr height="16"> 
          <td colspan="3" ><span class="STYLE17">�ۼ�Ͷ�ߣ�<%=lstscs%>�Σ��������ã�<%=lssmcs%>�Σ�
		  &nbsp;&nbsp;&nbsp;&nbsp;Ŀǰδ�᰸��<%=wjacs%>��&nbsp;&nbsp;&nbsp;&nbsp;�ѽ᰸��<%=(lstscs-wjacs)%>��</span></td>
        </tr>
        <tr height="16"> 
          <td width="32%" >�ͻ�������<%=khxm%></td>
          <td colspan="2" >��ַ��<%=fwdz%></td>
        </tr>
        <tr height="16"> 
          <td width="32%">���ʦ��<%=sjs%>��<%=qydm%>��</td>
          <td width="31%">ʩ���ӣ�<%=sgd%></td>
          <td width="37%">�ʼ�Ա��<%=zjy%></td>
        </tr>
      </table>    </td>
  </tr>
  <%
	int row1=0;
	ls_sql="SELECT tsjlh,slr,slsj,slfsmc,yzcdmc,tsnr,bz";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm,dm_yzcdbm ";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"' ";
	ls_sql+=" and lx='1' ";//1��Ͷ�ߣ�2������
	ls_sql+=" and crm_tsjl.clzt in('0','1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
	ls_sql+=wheresql;
	ls_sql+=" order by tsjlh desc";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tsjlh=cf.fillHtml(rs1.getString("tsjlh"));
		slr=cf.fillHtml(rs1.getString("slr"));
		slsj=cf.fillHtml(rs1.getDate("slsj"));
		slfsmc=cf.fillHtml(rs1.getString("slfsmc"));
		yzcdmc=cf.fillHtml(rs1.getString("yzcdmc"));
		tsnr=cf.fillHtml(rs1.getString("tsnr"));
		bz=cf.fillHtml(rs1.getString("bz"));
		if (!bz.equals("&nbsp;"))
		{
			bz="<B>��ע��</B><U>"+bz+"</U>";
		}

		row1++;
%>
  <tr>
    <td width="3%" align="center"><%=row1%></td>
    <td width="36%" valign="top" bgcolor="#FFFFCC"><b><%=tsjlh%>��<%=slr%>����<%=slfsmc%>Ͷ�ߣ�<%=slsj%>����<%=yzcdmc%>��</b>�� <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<U><%=tsnr%></U> 
	  <br><br><%=bz%> </td>
    <td width="1%">&nbsp;</td>
    <td width="60%" valign="top" bgcolor="#FFFFCC">

<%			
		String 	tspp=null;	
		String 	clzt=null;	
		ls_sql=" SELECT crm_tsbm.tspp,dwmc,tsyymc,tsxlmc,hfjgmc,DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,clqk,lrsj,lrr  ";
		ls_sql+=" FROM crm_tsbm,sq_dwxx,dm_hfjgbm,dm_tsxlbm,dm_tsyybm";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
		ls_sql+=" order by crm_tsbm.dwbh";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			tspp=rs3.getString("tspp");
			zrbm=rs3.getString("dwmc");
			hfjgmc=rs3.getString("hfjgmc");
			tsyymc=cf.fillHtml(rs3.getString("tsyymc"));
			tsxlmc=cf.fillHtml(rs3.getString("tsxlmc"));
			clzt=cf.fillHtml(rs3.getString("clzt"));
			clqk=rs3.getString("clqk");
			lrsj=cf.fillHtml(rs3.getDate("lrsj"));
			lrr=cf.fillHtml(rs3.getString("lrr"));

			if (clqk==null)
			{
				clqk="<B><font color=\"#CC0066\">���β���δ����</font></B>";
			}
			else{
				clqk=lrr+"��"+lrsj+"����<U>"+clqk+"</U>";
			}

			if (hfjgmc==null)
			{
				hfjgmc="δ�ط�";
			}

			if (tspp!=null)
			{
				tspp="&nbsp;&nbsp;&nbsp;&nbsp;<B>�漰����</B>��"+tspp;
			}
			else{
				tspp="";
			}
			%>
      <b>ԭ��</b>��<%=tsyymc%>��<%=tsxlmc%>��
      <br><b>����</b>��<U><font color=\"#0000CC\"><%=zrbm%></font></U>   <%=tspp%>
	  <br><b>����</b>��<%=clzt%></b>���ͷ��طã�<%=hfjgmc%>�� 
      <br><b>����</b>��<%=clqk%>
      <hr>
    <%
		}
		rs3.close();
		ps3.close();
		%></td>
  </tr>
  
<%
	}
	rs1.close();
	ps1.close();
%> 
  <tr> 
    <td colspan="4"> <%			
		int mark=0;
		ls_sql=" SELECT hfr,hfsj,khhfqk,cxxwt  ";
		ls_sql+=" FROM crm_tshfjl";
		ls_sql+=" where crm_tshfjl.khbh='"+khbh+"' and hfjlh in(select hfjlh from crm_tsjlhfmx where tsjlh='"+tsjlh+"')";
		ls_sql+=" order by hfsj desc";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			mark++;
			hfr=rs3.getString("hfr");
			hfsj=cf.fillHtml(rs3.getDate("hfsj"));
			khhfqk=cf.fillHtml(rs3.getString("khhfqk"));
			cxxwt=cf.fillHtml(rs3.getString("cxxwt"));
			if (!cxxwt.equals("&nbsp;"))
			{
				cxxwt="<BR><B>�ط��г��ֵ������⣺</B><U>"+cxxwt+"</U>";
			}
			%> <B><%=hfsj%><%=hfr%>�طã�</B><U><%=khhfqk%></U> 
			<%=cxxwt%><HR>
      <%
		}
		rs3.close();
		ps3.close();
		if (mark==0)
		{
			out.println("δ���ط�");
		}
		%> </td>
  </tr>
  <%	
%> 
</table>
<%
	}
	rs2.close();
	ps2.close();

%>







<CENTER >
  <B>δ�᰸���ޱ���</B>
</CENTER>

<%

//Ͷ�����س̶ȱ��룬01����΢Υ�£�02������Υ�£�03���ر�����
ls_sql=" SELECT khbh,count(*) wjacs";
ls_sql+=" from crm_tsjl";
ls_sql+=" where lx='2' and clzt in('0','1','2')";//1��Ͷ�ߣ�2������
ls_sql+=wheresql;
ls_sql+=" group by khbh";
ls_sql+=" order by wjacs desc";
//out.println(ls_sql);
ps2= conn.prepareStatement(ls_sql);
rs2 =ps2.executeQuery(ls_sql);
while (rs2.next())
{
	khbh=rs2.getString("khbh");
	wjacs=rs2.getInt("wjacs");//Ŀǰδ�᰸

	ls_sql="SELECT khbh,crm_khxx.khxm||'('||crm_khxx.lxfs||')' khxm";
	ls_sql+=" ,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,dwmc,sgdmc sgd";
	ls_sql+=" FROM crm_khxx,sq_dwxx ,sq_sgd  ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjy=cf.fillNull(rs.getString("zjxm"));
		qydm=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
	ps.close();

	//�ۼƱ���
	ls_sql=" SELECT count(*) lstscs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"'";
	ls_sql+=" and lx='2' and clzt!='9'";//1��Ͷ�ߣ�2������
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		lstscs=rs1.getInt("lstscs");
	}
	rs1.close();
	ps1.close();
		
	//����
	ls_sql=" SELECT count(*) lssmcs";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where crm_tsjl.khbh='"+khbh+"' and slfsbm='3'";
	ls_sql+=" and lx='2' and clzt!='9'";//1��Ͷ�ߣ�2������
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		lssmcs=rs1.getInt("lssmcs");
	}
	rs1.close();
	ps1.close();
		
		
	row++;

	if (row%2==0)
	{
		bgcolor="#E8E8FF";
	}
	else{
		bgcolor="#FFFFFF";
	}
	%> 
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
  <tr> 
    <td align="center" rowspan="<%=(2+wjacs)%>" width="3%"><%=row%></td>
    <td colspan="6" height="50"> 
      <table width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:12" bgcolor="<%=bgcolor%>">
        <tr height="16"> 
          <td colspan="3" ><span class="STYLE17">�ۼƱ��ޣ�<%=lstscs%>�Σ��������ã�<%=lssmcs%>�Σ�
		  &nbsp;&nbsp;&nbsp;&nbsp;Ŀǰδ�᰸��<%=wjacs%>��&nbsp;&nbsp;&nbsp;&nbsp;�ѽ᰸��<%=(lstscs-wjacs)%>��</span></td>
        </tr>
        <tr height="16"> 
          <td width="32%" >�ͻ�������<%=khxm%></td>
          <td colspan="2" >��ַ��<%=fwdz%></td>
        </tr>
        <tr height="16"> 
          <td width="32%">���ʦ��<%=sjs%>��<%=qydm%>��</td>
          <td width="31%">ʩ���ӣ�<%=sgd%></td>
          <td width="37%">�ʼ�Ա��<%=zjy%></td>
        </tr>
      </table>    </td>
  </tr>
  <%
	int row1=0;
	ls_sql="SELECT tsjlh,slr,slsj,slfsmc,yzcdmc,tsnr,bz";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm,dm_yzcdbm ";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"' ";
	ls_sql+=" and lx='2' and clzt in('1','2','0')";//1��Ͷ�ߣ�2������
	ls_sql+=wheresql;
	ls_sql+=" order by tsjlh desc";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tsjlh=cf.fillHtml(rs1.getString("tsjlh"));
		slr=cf.fillHtml(rs1.getString("slr"));
		slsj=cf.fillHtml(rs1.getDate("slsj"));
		slfsmc=cf.fillHtml(rs1.getString("slfsmc"));
		yzcdmc=cf.fillHtml(rs1.getString("yzcdmc"));
		tsnr=cf.fillHtml(rs1.getString("tsnr"));
		bz=cf.fillHtml(rs1.getString("bz"));
		if (!bz.equals("&nbsp;"))
		{
			bz="<B>��ע��</B><U>"+bz+"</U>";
		}

		row1++;
%>
  <tr>
    <td width="3%" align="center"><%=row1%></td>
    <td width="36%" bgcolor="#FFFFCC" valign="top"><b><%=slr%>����<%=slfsmc%>���ޣ�<%=slsj%>��</b>��
	<BR>&nbsp;&nbsp;&nbsp;&nbsp;<U><%=tsnr%></U>
	<br><br><%=bz%> </td>
    <td width="1%">&nbsp;</td>
    <td width="60%" bgcolor="#FFFFCC" valign="top">
<%			
		String tspp=null;		
		String 	clzt=null;	
		ls_sql=" SELECT crm_tsbm.tspp,dwmc,tsyymc,tsxlmc,hfjgmc,DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,clqk,lrsj,lrr  ";
		ls_sql+=" FROM crm_tsbm,sq_dwxx,dm_hfjgbm,dm_tsxlbm,dm_tsyybm";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
		ls_sql+=" order by crm_tsbm.dwbh";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			tspp=rs3.getString("tspp");
			zrbm=rs3.getString("dwmc");
			hfjgmc=rs3.getString("hfjgmc");
			tsyymc=cf.fillHtml(rs3.getString("tsyymc"));
			tsxlmc=cf.fillHtml(rs3.getString("tsxlmc"));
			clzt=cf.fillHtml(rs3.getString("clzt"));
			clqk=rs3.getString("clqk");
			lrsj=cf.fillHtml(rs3.getDate("lrsj"));
			lrr=cf.fillHtml(rs3.getString("lrr"));

			if (clqk==null)
			{
				clqk="<B><font color=\"#CC0066\">���β���δ����</font></B>";
			}
			else{
				clqk=""+lrr+"��"+lrsj+"����<U>"+clqk+"</U>";
			}

			if (hfjgmc==null)
			{
				hfjgmc="δ�ط�";
			}

			if (tspp!=null)
			{
				tspp="&nbsp;&nbsp;&nbsp;&nbsp;<B>�漰����</B>��"+tspp;
			}
			else{
				tspp="";
			}

			%>
		  <b>ԭ��</b>��<%=tsyymc%>��<%=tsxlmc%>��
		  <br><b>����</b>��<U><font color=\"#0000CC\"><%=zrbm%></font></U>   <%=tspp%>
			<br><b>����</b>��<%=clzt%>���ͷ��طý����<%=hfjgmc%>�� 
			<br><b>����</b>��<%=clqk%>
			<HR>
			  <%
		}
		rs3.close();
		ps3.close();
		%>
</td>
  </tr>
<%
	}
	rs1.close();
	ps1.close();
%> 
  <tr> 
    <td colspan="4"> <%	
		int mark=0;
		ls_sql=" SELECT hfr,hfsj,khhfqk,cxxwt  ";
		ls_sql+=" FROM crm_tshfjl";
		ls_sql+=" where crm_tshfjl.khbh='"+khbh+"' and hfjlh in(select hfjlh from crm_tsjlhfmx where tsjlh='"+tsjlh+"')";
		ls_sql+=" order by hfsj desc";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery(ls_sql);
		while (rs3.next())
		{
			mark++;
			hfr=rs3.getString("hfr");
			hfsj=cf.fillHtml(rs3.getDate("hfsj"));
			khhfqk=cf.fillHtml(rs3.getString("khhfqk"));
			cxxwt=cf.fillHtml(rs3.getString("cxxwt"));
			if (!cxxwt.equals("&nbsp;"))
			{
				cxxwt="<BR><B>�ط��г��ֵ������⣺</B><U>"+cxxwt+"</U>";
			}
			%> 
			<B><%=hfsj%><%=hfr%>�طã�</B><U><%=khhfqk%></U> 
			<%=cxxwt%><HR>
			<%
		}
		rs3.close();
		ps3.close();
		if (mark==0)
		{
			out.println("δ���ط�");
		}
		%> </td>
  </tr>
  <%	
%> 
</table>
<%

	}
	rs2.close();
	ps2.close();


}
catch (Exception e) {
	out.print("��������: " + e);
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>