<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Xz_bdglList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">发布分公司</td>
              <td width="33%"><%
	if (yhjs.equals("A0") )
	{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,xz_bdgl_fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
	%></td>
              <td width="14%" align="right">发布部门</td>
              <td width="36%"> 
                <select name="xz_bdgl_fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") )
		{
			out.println("<option value=\"\"></option>");
//			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
		}
		else
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">表单编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xz_bdgl_bdbh" size="20" maxlength="20" >
              </td>
              <td width="14%"> 
                <div align="right">表单附件</div>
              </td>
              <td width="36%"> 
                <input type="text" name="xz_bdgl_bdfj" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">表单名称</td>
              <td width="33%"> 
                <input type="text" name="xz_bdgl_bdmc" size="20" maxlength="100" >
              </td>
              <td align="right" width="14%">发布范围</td>
              <td width="36%"> 
                <input type="radio" name="fbfw" value="1">
                本公司 
                <input type="radio" name="fbfw" value="2">
                集团 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">发布人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="fbr" size="20" maxlength="20" >
              </td>
              <td width="14%"> 
                <div align="right">录入人</div>
              </td>
              <td width="36%"> 
                <input type="text" name="xz_bdgl_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xz_bdgl_lrsj" size="20" maxlength="10" >
              </td>
              <td width="14%"> 
                <div align="right">到</div>
              </td>
              <td width="36%"> 
                <input type="text" name="xz_bdgl_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">发布时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xz_bdgl_fbsj" size="20" maxlength="10" >
              </td>
              <td width="14%"> 
                <div align="right">到</div>
              </td>
              <td width="36%"> 
                <input type="text" name="xz_bdgl_fbsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="xz_bdgl.fbsj desc">发布时间</option>
                  <option value="xz_bdgl.bdmc">表单名称</option>
                  <option value="xz_bdgl.bdbh">表单编号</option>
                  <option value="xz_bdgl.fbr">发布人</option>
                  <option value="xz_bdgl.fbbm">发布部门</option>
                  <option value="xz_bdgl.fbfgs">发布分公司</option>
                  <option value="xz_bdgl.fbfw">发布范围</option>
                  <option value="xz_bdgl.lrr">录入人</option>
                  <option value="xz_bdgl.lrsj">录入时间</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="xz_bdgl.fbsj desc">发布时间</option>
                  <option value="xz_bdgl.bdmc">表单名称</option>
                  <option value="xz_bdgl.bdbh">表单编号</option>
                  <option value="xz_bdgl.fbr">发布人</option>
                  <option value="xz_bdgl.fbbm">发布部门</option>
                  <option value="xz_bdgl.fbfgs">发布分公司</option>
                  <option value="xz_bdgl.fbfw">发布范围</option>
                  <option value="xz_bdgl.lrr">录入人</option>
                  <option value="xz_bdgl.lrsj">录入时间</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="xz_bdgl.fbsj desc">发布时间</option>
                  <option value="xz_bdgl.bdmc">表单名称</option>
                  <option value="xz_bdgl.bdbh">表单编号</option>
                  <option value="xz_bdgl.fbr">发布人</option>
                  <option value="xz_bdgl.fbbm">发布部门</option>
                  <option value="xz_bdgl.fbfgs">发布分公司</option>
                  <option value="xz_bdgl.fbfw">发布范围</option>
                  <option value="xz_bdgl.lrr">录入人</option>
                  <option value="xz_bdgl.lrsj">录入时间</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">每页显示数量</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.xz_bdgl_fbsj, "发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_bdgl_fbsj2, "发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_bdgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_bdgl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
