<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] fgsbh=request.getParameterValues("fgsbh");
ybl.common.PageObject pageObj=new ybl.common.PageObject();

if (fgsbh==null)
{
	return;
}

String wheresql="";



wheresql=" and "+cf.arrayToInSQL(fgsbh,"crm_khxx.fgsbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
String ls_sql=null;


try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>����ҵ��ͳ��</B>��<span class="STYLE1">ע�⣺��ɫ�����ʾ����δ���㣬��Ӧ��</span>��<BR>
</CENTER>

<form method="post" action="" name="insertform" target="_blank">
<table border="1" width="240%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="2%" >&nbsp;</td>
  <td  width="2%" >���</td>
  <td  width="3%" >�ͻ�����</td>
  <td  width="5%" >��ͬ��</td>
  <td  width="5%" >����</td>
  <td  width="11%" >���ݵ�ַ</td>
  <td  width="3%" >����ʵ�ձ���</td>
  <td  width="5%" >����ĩ������ </td>
  <td  width="3%" >����ĩ�������</td>
  <td  width="5%" >ǩԼ����</td>
  <td  width="6%" >����δ���۽��</td>
  <td  width="6%" >����ǩ����</td>
  <td  width="5%" >�����</td>
  <td  width="5%" >˰��</td>
  <td  width="6%" >��װʵ�տ��</td>
  <td  width="6%" >����ʵ�տ��</td>
  <td  width="5%" >�˵�����</td>
  <td  width="3%" >����ҵ������</td>
  <td  width="4%" >�ͻ����</td>
  <td  width="4%" >���ʦ</td>
  <td  width="6%" >����</td>
</tr>
<%
	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;

	double wdzgce=0;
	double qye=0;
	double guanlif=0;
	double suijin=0;
	double sfke=0;
	double cwsfke=0;
	double cwsfbl=0;

	String qyrq=null;
	String tdsj=null;
	String yjjzsj=null;
	String tdyjjzsj=null;
	String dwmc=null;
	double jryjbfb=0;
	String zt=null;

	int row=0;

	String nian=cf.today().substring(0,4);
	String yue=cf.today().substring(5,7);
	String jzrq=cf.firstDay(nian,yue);


	//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	ls_sql=" SELECT crm_khxx.khbh,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,wdzgce,qye,guanlif,suijin,crm_khxx.sfke,crm_khxx.cwsfke";
	ls_sql+=" ,crm_khxx.qyrq,crm_khxx.tdsj,crm_khxx.yjjzsj,crm_khxx.tdyjjzsj,b.dwmc dwmc,a.jryjbfb ";
	ls_sql+=" ,DECODE(crm_khxx.zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>') zt";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh";
	ls_sql+=" and b.sfjms='N'";//N����Y����
	ls_sql+=" and crm_khxx.yjjzsj is null";//δ��ת�ĵ�������������
//	ls_sql+=" and crm_khxx.cwsfke>=(qye+NVL(guanlif,0)+NVL(suijin,0))*((a.jryjbfb-0.5)/100)";
	ls_sql+=" and crm_khxx.cwsfke>=qye*((a.jryjbfb-0.5)/100)";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs,crm_khxx.khxm";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");

		sfke=rs.getDouble("sfke");
		cwsfke=rs.getDouble("cwsfke");

		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		yjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillHtml(rs.getDate("tdyjjzsj"));

		dwmc=rs.getString("dwmc");
		jryjbfb=rs.getDouble("jryjbfb");
		zt=rs.getString("zt");

		double fkje=0;
		double fkbl=0;
		ls_sql=" SELECT sum(fkje)";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and sjsj<TO_DATE('"+jzrq+"','YYYY-MM-DD')";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (qye!=0)
		{
			fkbl=fkje*100/qye;
		}
		else{
			fkbl=0;
		}

		fkbl=cf.round(fkbl,2);


		if (qye!=0)
		{
			cwsfbl=cwsfke*100/qye;
		}
		else{
			cwsfbl=0;
		}
		cwsfbl=cf.round(cwsfbl,2);

		String bgcolor="#FF0000";
		String mark="";
		if (fkbl>=(jryjbfb-0.5))
		{
			mark="checked=true";
			bgcolor="#FFFFF";
		}


		row++;

		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td>
				<input name="khbh" type="checkbox" value="<%=khbh%>" <%=mark%>>
			</td>
			<td><%=row%></td>
			<td><%=zt%></td>
			<td><%=hth%></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td  align="right" ><%=cf.formatDouble(cwsfbl)%>%</td>
			<td><%=fkje%></td>
			<td><%=fkbl%>%</td>
			<td><%=qyrq%></td>
			<td  align="right" ><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" ><%=cf.formatDouble(qye)%></td>
			<td  align="right" ><%=cf.formatDouble(guanlif)%></td>
			<td  align="right" ><%=cf.formatDouble(suijin)%></td>
			<td  align="right" ><%=cf.formatDouble(sfke)%></td>
			<td  align="right" ><%=cf.formatDouble(cwsfke)%></td>
			<td><%=tdsj%></td>
			<td><%=jryjbfb%>%</td>
			<td><%=khbh%></td>
			<td><%=sjs%></td>
			<td><%=dwmc%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
    <tr align="center"> 
      <td colspan="7"> 
        <input type="button"  value="����" onClick="f_do(insertform)" >
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	FormName.action="yjqmjz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

