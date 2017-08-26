<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String jcppbz=request.getParameter("jcppbz");
String tsjlh=request.getParameter("tsjlh");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;
String ssfgs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select crm_tsjl.khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx,crm_tsjl";
	ls_sql+=" where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh='"+tsjlh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#FFFFFF">

<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入投诉原因（投诉记录号：<%=tsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_tsbm.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>              </td>
              <td width="29%"> <%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">合同号</font></div>              </td>
              <td width="39%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>              </td>
              <td width="29%"> <%=khxm%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>              </td>
              <td width="39%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>              </td>
              <td width="29%"> <%=sjs%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">质检员</font></div>              </td>
              <td width="39%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>              </td>
              <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>              </td>
              <td width="39%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉大类</td>
              <td width="29%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getXlItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tsdl='2' order by tslxbm","");
%> 
                </select>              </td>
              <td width="15%" rowspan="6" align="right" valign="top">涉及厂商</td>
              <td width="39%" rowspan="6" valign="top"> 
				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="xllb" >
					<tr>
					  <td >
						<select name="tspp" style="FONT-SIZE:12PX;WIDTH:252PX" >
						  <option value=""></option>
						</select>					  </td>
					</tr>
				  </table>

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="rglr" style="display:none">
					<tr>
					  <td >
						<input type="text" name="rglrtspp" size="34" maxlength="50" >					  </td>
					</tr>
			  </table>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉小类</td>
              <td width="29%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getYyItem(insertform)">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉原因</td>
              <td width="29%"> 
                <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right"><font color="#FF0033">*</font>责任部门</td>
              <td width="29%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(insertform)">
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>负责人</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">涉及厂商</td>
              <td width="29%">
<%
	if (zdyhbz.equals("Y"))
	{
		%>
		<input type="radio" name="rglrbz" value="1" checked onClick="xllb.style.display ='block';rglr.style.display ='none';">
		从下拉列表选 
		<input type="radio" name="rglrbz" value="2" onClick="xllb.style.display ='none';rglr.style.display ='block';">
		人工录入 
		<%
	}
	else{
		%>
		<input type="radio" name="rglrbz" value="1" checked >
		从下拉列表选 
		<%
	}
%>			  </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="jcppbz" value="<%=jcppbz%>">
                <input type="hidden" name="khbh" value="<%=khbh%>">
                <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>">
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function getXlItem(FormName)
{
	if (FormName.tslxbm.value=='')
	{
		return;
	}

	czlx=1;

	FormName.tsxlbm.length=1;
	FormName.tsyybm.length=1;
	FormName.tspp.length=1;
	FormName.dwbh.value="";

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tslxbm="+FormName.tslxbm.value;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getYyItem(FormName)
{
	if (FormName.tsxlbm.value=='')
	{
		return;
	}

	czlx=2;

	FormName.tsyybm.length=1;

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tsxlbm="+FormName.tsxlbm.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getZrbm(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;

	czlx=3;

	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		insertform.tsxlbm.length=1;
		var value1=getStrValue(ajaxRetStr,1);
		strToSelect(insertform.tsxlbm,value1);
	}
	else if (czlx==2)
	{
		insertform.tsyybm.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(insertform.tsyybm,value3);

		insertform.tspp.length=1;
		var value4=getStrValue(ajaxRetStr,4);
		strToSelect(insertform.tspp,value4);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ygbh,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("请选择[投诉大类]！");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("请选择[投诉小类]！");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("请选择[投诉原因]！");
		FormName.tsyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[责任部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请选择[负责人]！");
		FormName.ygbh.focus();
		return false;
	}

/*
	if (FormName.tslxbm.value=="12")
	{
		<%
		if (zdyhbz.equals("Y"))
		{
			%> 
			if (FormName.rglrbz[0].checked)//从下拉列表选
			{
				if(	javaTrim(FormName.tspp)=="") {
					alert("请从列表中选择[涉及厂商]，若列表中不存在，可选择【人工录入】！");
					FormName.tspp.focus();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.rglrtspp)=="") {
					alert("请人工录入[涉及厂商]！");
					FormName.rglrtspp.focus();
					return false;
				}
			}
			<%
		}
		else{
			%> 
			if(	javaTrim(FormName.tspp)=="") {
				alert("请从列表中选择[涉及厂商]！");
				FormName.tspp.focus();
				return false;
			}
			<%
		}
		%>
	}
*/


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
