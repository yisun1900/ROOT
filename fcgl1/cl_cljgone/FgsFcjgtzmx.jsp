<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
����.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>

<%
String ssfgs=request.getParameter("fgs");
String wheresql="";
String whereclbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrbfb=null;
String jldwmc=null;
String xjgsfgx=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
String cldlmc=null;

String wxr=null;
wxr=request.getParameter("wxr");
if (wxr!=null)
{
	wxr=cf.GB2Uni(wxr);
	if (!(wxr.equals("")))	wheresql+=" and  (cl_clbm.wxr='"+wxr+"')";
}

cldlmc=request.getParameter("cldlmc");
if (cldlmc!=null)
{
	cldlmc=cf.GB2Uni(cldlmc);
	if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
}
xjgsfgx=request.getParameter("xjgsfgx");
if (xjgsfgx!=null)
{
	xjgsfgx=xjgsfgx.trim();
	if (!(xjgsfgx.equals("")))	wheresql+=" and  (cl_jgmx.xjgsfgx='"+xjgsfgx+"') ";
}
whereclbm=request.getParameter("clbm");
if (whereclbm!=null)
{
	whereclbm=whereclbm.trim();
	if (!(whereclbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+whereclbm+"') ";
}
jldwmc=request.getParameter("jldwmc");
if (jldwmc!=null)
{
	jldwmc=cf.GB2Uni(jldwmc);
	if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
}
String clbm=null;
clbm=request.getParameter("clbm");
if (clbm!=null)
{
	clbm=cf.GB2Uni(clbm);
	if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
}
clmc=request.getParameter("clmc");
if (clmc!=null)
{
	clmc=cf.GB2Uni(clmc);
	if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc like '%"+clmc+"%')";
}
clgg=request.getParameter("clgg");
if (clgg!=null)
{
	clgg=cf.GB2Uni(clgg);
	if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg like '%"+clgg+"%')";
}
lrjsfs=request.getParameter("lrjsfs");
if (lrjsfs!=null)
{
	lrjsfs=cf.GB2Uni(lrjsfs);
	if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
}
lrbfb=request.getParameter("lrbfb");
if (lrbfb!=null)
{
	lrbfb=lrbfb.trim();
	if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb>="+lrbfb+") ";
}
lrbfb=request.getParameter("lrbfb2");
if (lrbfb!=null)
{
	lrbfb=lrbfb.trim();
	if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb<="+lrbfb+") ";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String clbm2=null;
String clmc2=null;
String clgg2=null;
String jldwmc2=null;
double cj2=0;
double cjjsj2=0;
double fgsdj2=0;
double gdj2=0;
String ckmc2=null;
String sfrk2=null;

String dwmc=null;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	ls_sql=" update cl_jgmx set cjjsj=xcjjsj,gdj=xgdj  ,xjgsfgx='2',xjgsxsj=null,xcjjsj=null,xgdj=null";
	ls_sql+=" where dwbh='"+ssfgs+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
%>

<form method="post" action="SaveFgsFcjgtzmx.jsp" name="selectform" target="_back">
  <b>�ֹ�˾�����۸�<%=dwmc%>��</b>
        
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="5%"><b>���</b></td>
      <td width="12%" ><b>���ϱ���</b></td>
      <td width="16%"><b>��������</b></td>
      <td width="7%"><b>������λ</b></td>
      <td width="9%"><b>�ֹ�˾���ϵ���</b></td>
      <td width="11%"><b>���Ӽ�</b></td>
      <td width="16%"><b>�ֿ�����</b></td>
      <td width="7%"><b>�Ƿ����</b></td>
      <td width="17%"><b>���Ϲ��</b></td>
    </tr>
    <%

	ls_sql=" SELECT cl_clbm.clbm clbm,clmc,clgg,jldwmc,cj,cjjsj,fgsdj,gdj,ckmc,sfrk ";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
	ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and  cl_jgmx.dwbh='"+ssfgs+"'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		i+=1;
		clbm2=cf.fillNull(rs.getString("clbm"));
		clmc2=cf.fillNull(rs.getString("clmc"));
		clgg2=cf.fillNull(rs.getString("clgg"));
		jldwmc2=cf.fillNull(rs.getString("jldwmc"));
		cj2=rs.getDouble("cj");
		cjjsj2=rs.getDouble("cjjsj");
		fgsdj2=rs.getDouble("fgsdj");
		gdj2=rs.getDouble("gdj");
		ckmc2=cf.fillNull(rs.getString("ckmc"));
		sfrk2=cf.fillNull(rs.getString("sfrk"));
	%> 
    <tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center"> 
      <td ><%=i%></td>
       <td > <%=clbm2%>
          <input type="hidden" name="clbm" value="<%=clbm2%>">
      </td>
     <td><%=clmc2%></td>
      <td ><%=jldwmc2%></td>
      <td> <%=fgsdj2%></td>
      <td > 
        <input type="text" name="gdj" size="8" maxlength="13" value="<%=gdj2%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(ckmc[<%=(i-1)%>])">
      </td>
      <td > 
        <input type="text" name="ckmc" size="14" maxlength="50" value="<%=ckmc2%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gdj[<%=i%>])">
      </td>
      <td > 
	  <select name="sfrk" style="FONT-SIZE:12px;WIDTH:40px">
		<%
		cf.selectToken(out,"Y+��&N+��",sfrk2);
		%>
	</select>
      </td>
      <td ><%=clgg2%></td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    <tr bgcolor="CCCCCC" align="center"> 
      <td colspan="10"> 
        <input type="hidden" name="dwbh" value="<%=ssfgs%>">
        <input type="button"  value=" �� �� " onClick="f_do(selectform)">
      </td>
    </tr>
  </table>
		</form>
		</body>
		</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>