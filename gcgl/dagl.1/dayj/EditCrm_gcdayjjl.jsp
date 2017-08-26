<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhmc=(String)session.getAttribute("yhmc");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

	int jlh=Integer.parseInt(request.getParameter("jlh"));
	int jlh1=0;

	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
	String khbh=null;
	String damxbm=null;
	String yjrfgs="";
	String yjrdw="";
	String yjr="";
	String jsr="";
	String jsrdw="";
	String jsrfgs="";
	java.sql.Date yjsj=null;
	java.sql.Date oldyjsj=null;
	String bz="";
	
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();



		ls_sql="select khbh,damxbm,yjr,yjrdw,yjrfgs,yjsj,oldyjsj,jsr,jsrdw,jsrfgs,bz ";
		ls_sql+=" from  crm_gcdayjjl";
		ls_sql+=" where  jlh="+jlh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			damxbm=cf.fillNull(rs.getString("damxbm"));
			yjr=cf.fillNull(rs.getString("yjr"));
			yjrdw=cf.fillNull(rs.getString("yjrdw"));
			yjrfgs=cf.fillNull(rs.getString("yjrfgs"));
			yjsj=rs.getDate("yjsj");
			oldyjsj=rs.getDate("oldyjsj");
			jsr=cf.fillNull(rs.getString("jsr"));
			jsrdw=cf.fillNull(rs.getString("jsrdw"));
			jsrfgs=cf.fillNull(rs.getString("jsrfgs"));
			bz=cf.fillNull(rs.getString("bz"));
		}
		rs.close();
		ps.close();

		ls_sql="select MAX(jlh) from crm_gcdayjjl where khbh='"+khbh+"' and damxbm='"+damxbm+"'";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jlh1=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		if(jlh!=jlh1)
		{
			
			out.println("<B>只能修改此明细的最后一次移交记录！");
			return;
		}
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

<body bgcolor="#FFFFFF" >
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入移交信息 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_gcdayjjl.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1">已登记档案明细</span></td>
              <td width="33%"><select name="damxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectgroup(insertform)">
               
                <%
		cf.selectItem(out,"select damxbm,damxmc from dm_damxbm where damxbm in (select damxbm from crm_gcdagl where khbh='"+khbh+"') order by damxbm",damxbm,false);
%>
              </select></td>
              <td width="16%" align="right"><span class="STYLE1">客户编号</span></td>
              <td width="34%"> 
                <input type="text" name="khbh" size="20" maxlength="20" value="<%=khbh%>" readonly>              </td>
            </tr>
             <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1"> 
              移交分公司              </span></td>
              <td width="33%">
                <%
        out.println("        <select name=\"yjrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh='"+yjrfgs+"' order by dwbh",yjrfgs);
        out.println("        </select>");
%>
              </select></td>
              <td width="16%" align="right"><span class="STYLE1"> 
              移交单位              </span></td>
              <td width="35%"><select name="yjrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and dwbh='"+yjrdw+"' order by dwbh",yjrdw);

%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><span class="STYLE1"> 
              移交人              </span></td>
              <td width="33%"> 
                <input type="text" name="yjr" size="20" maxlength="50" value="<%=yjr%>" readonly>              </td>
              <td width="16%" align="right"><span class="STYLE1"> 
              开始保管时间              </span></td>
              <td width="34%"><input type="text" name="oldyjsj" size="20" maxlength="50"  value="<%=oldyjsj%>" readonly></td>
            </tr> 
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                <span class="STYLE2">*</span>接受分公司              </td>
              <td width="31%">
				<select name="jsrfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsrfgs+"'","");
%>
				</select>              </td>
              <td width="17%" align="right"> 
                <span class="STYLE2">*</span>接受单位              </td>
              <td width="33%"> 
                <select name="jsrdw" style="FONT-SIZE:12PX;WIDTH:152PX" >
				<option value=""></option>
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+jsrfgs+"' and  cxbz='N' order by dwlx,dwbh",jsrdw);
%> 
                </select>              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <span class="STYLE2">*</span>接受人              </td>
              <td width="33%"> 
                <input type="text" name="jsr" size="20" maxlength="50" value="<%=jsr%>" >              </td>
              <td width="16%" align="right"> 
                <span class="STYLE2">*</span>移交时间              </td>
              <td width="34%"><input type="text" name="yjsj" size="20" maxlength="50" value="<%=yjsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <span class="STYLE1"><span class="STYLE2">*</span>录入人</span> </td>
              <td width="33%"><input type="text" name="lrr" size="20" maxlength="50" value="<%=yhmc%>" readonly></td>
              <td width="16%" align="right"> 
                <span class="STYLE1"><span class="STYLE2">*</span>录入时间</span> </td>
              <td width="34%"> 
                <input type="text" name="lrsj" size="20" maxlength="50" value="<%=cf.today()%>" readonly >              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
			  <td width="17%" align="right"> 
				备注			  </td>
			  <td colspan="3"><textarea name="bz" cols="72" rows="3" ><%=bz%></textarea></td>
			</tr>
            <tr align="center"> 
              <td colspan="4"> 
				<input type="hidden" name="jlh"  value="<%=jlh%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
              <input type="reset"  value="重输"></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function selectgroup(FormName)//参数FormName:Form的名称
{
	FormName.action="EditCrm_gcdayjjl.jsp";
	FormName.submit();
	return true;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.yjsj, "移交时间"))) {
		return false;
	}
	if(	javaTrim(FormName.damxbm)=="") {
		alert("请选择【档案明细】！");
		FormName.damxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("请输入[移交时间]！");
		FormName.yjsj.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrfgs)=="") {
		alert("请选择【接受人分公司】！");
		FormName.jsrfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrdw)=="") {
		alert("请选择【接受人单位】！");
		FormName.jsrdw.focus();
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[接受人]！");
		FormName.jsr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
function f_cx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.damxbm)=="") {
		alert("请选择【档案明细】！");
		FormName.damxbm.focus();
		return false;
	}
	FormName.action="Crm_gcdayjjlList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
