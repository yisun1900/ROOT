<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">申请部门</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">申请时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sqsj" value=<%=cf.today()%> size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">数量</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" value="" size="20" maxlength="6" onblur= "" >
              </td>
              <td width="15%"> 
                <div align="right">规格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" value="" size="20" maxlength="30"  >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">形式 
              </td>
              <td width="35%"> 
                <input type="text" name="xs" value="" size="20" maxlength="30" >
              </td>
              <td width="15%"> 
                <p align="right">完成时间 
              </td>
              <td width="35%"> 
                <input type="text" name="wcsj" value=<%=cf.today()%> size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">制作内容</div>
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="zznr" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">颜色要求</div>
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="ysyq" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">文字内容 
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="wznr" cols="72" rows="5"></textarea>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">其它要求</div>
              </td>
              <td width="85%" colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="qtyq" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%">
                <div align="right">企划文件名</div>
              </td>
              <td width="85%" colspan="3">
                <input type="file" name="loadname" size="72" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 主管部门经理意见 </td>
              <td width="85%" colspan="3"> 
                <textarea name="zgbmjlyj" cols="72" rows="2"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="上传企划文件" onClick="f_do2(insertform)" name="button">
                <input type="reset"  value="重输" name="reset">
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

//function calValue(FormName){
//if (javaTrim(FormName.jg)!=""&& javaTrim(FormName.sl)!="")
//{
//	
//FormName.fyzj.value=parseFloat(FormName.jg.value)*parseFloat(FormName.sl.value);
		
//}
//}    
function f_do(FormName)//参数FormName:Form的名称
{
	
	if(	javaTrim(FormName.sqsj)=="") {
		alert("请输入[申请时间]！");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "申请时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
		}
	if(	javaTrim(FormName.zznr)=="") {
		alert("请输入[制作内容]！");
		FormName.zznr.focus();
		return false;
	}
	
	if(	javaTrim(FormName.wcsj)=="") {
		alert("请输入[完成时间]！");
		FormName.wcsj.focus();
		return false;
	}
	if(	javaTrim(FormName.loadname)=="") {
		alert("请输入[企划文件名]！");
		FormName.loadname.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "完成时间"))) {
		return false;
	}
	FormName.action="SaveInsertQh_xcpzzsh.jsp";		
	FormName.submit();
	return true;
}
function f_do2(FormName)//参数FormName:Form的名称
{

	FormName.action="loadFile.jsp";	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
