<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String dqbm=request.getParameter("dqbm");
String[] xmbh = request.getParameterValues("xmbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" target="_blank">
		  <p> 
            <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
<%
	for (int i=0;i<xmbh.length ;i++ )
	{
		out.println("<input type=\"hidden\" name=\"xmbh\" value=\""+xmbh[i]+"\" >");
	}
%> 
			1、批量修改工程报价
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="32%" height="2" align="right">选择需修改价格</td>
              <td width="68%" height="2"> 
                <select name="jgzd" onChange="jggs.value=''">
                  <option value=""></option>
                  <option value="bj"><%=dzbjzjmc%>报价</option>
                  <option value="bbj"><%=dzbjzgjmc%>报价</option>
                  <option value="cbj"><%=dzbjgjmc%>报价</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td rowspan="2" align="right" width="32%">生成修改公式</td>
              <td width="68%"> 
                <select name="jgfh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="bj"><%=dzbjzjmc%>报价</option>
                  <option value="bbj"><%=dzbjzgjmc%>报价</option>
                  <option value="cbj"><%=dzbjgjmc%>报价</option>
                </select>
                <input type="text" name="jgxs" size="14">
                <input type="button"  value="增加" onClick="jggs.value+=jgfh.value+jgxs.value" name="button4">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="68%"> 
                <input type="text" name="jggs" size="30" readonly="true">
                <input type="button"  value="修改价格" onClick="f_jg(selectform)" name="button32">
              </td>
            </tr>
          </table>
          <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">修改材料费</div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="43%" height="2" align="right">被修改材料费 
                <select name="clfzd" onChange="clfgs.value=''">
                  <option value=""></option>
                  <option value="clf"><%=dzbjzjmc%>材料费</option>
                  <option value="bclf"><%=dzbjzgjmc%>材料费</option>
                  <option value="cclf"><%=dzbjgjmc%>材料费</option>
                </select>
                = </td>
              <td width="57%" height="2"> 
                <input type="text" name="clfgs" size="30" readonly="true">
                <input type="button"  value="修改" onClick="f_clf(selectform)" name="button3">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="43%" align="right">修改公式：</td>
              <td width="57%"> 
                <select name="clffh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="clf"><%=dzbjzjmc%>材料费</option>
                  <option value="bclf"><%=dzbjzgjmc%>材料费</option>
                  <option value="cclf"><%=dzbjgjmc%>材料费</option>
                   <option value="bj"><%=dzbjzjmc%>报价</option>
                  <option value="bbj"><%=dzbjzgjmc%>报价</option>
                  <option value="cbj"><%=dzbjgjmc%>报价</option>
               </select>
                <input type="text" name="clfxs" size="12">
                <input type="button"  value="增加" onClick="clfgs.value+=clffh.value+clfxs.value" name="button">
              </td>
            </tr>
          </table>
          <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">修改主材费</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">被修改主材料 
                <select name="clylzd" onChange="clylgs.value=''">
                  <option value=""></option>
                  <option value="zcf"><%=dzbjzjmc%>主材费</option>
                  <option value="bzcf"><%=dzbjzgjmc%>主材费</option>
                  <option value="czcf"><%=dzbjgjmc%>主材费</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="clylgs" size="30" readonly="true">
                <input type="button"  value="修改" onClick="f_clyl(selectform)" name="button3">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">修改公式：</td>
              <td width="53%"> 
                <select name="clylfh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="zcf"><%=dzbjzjmc%>主材费</option>
                  <option value="bzcf"><%=dzbjzgjmc%>主材费</option>
                  <option value="czcf"><%=dzbjgjmc%>主材费</option>
                </select>
                <input type="text" name="clylxs" size="11">
                <input type="button"  value="增加" onClick="clylgs.value+=clylfh.value+clylxs.value" name="button">
              </td>
            </tr>
          </table>
		  <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">修改人工费</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">被修改人工费 
                <select name="rgf" onChange="rgf1.value=''">
                  <option value=""></option>
                  <option value="rgf"><%=dzbjzjmc%>人工费</option>
                  <option value="brgf"><%=dzbjzgjmc%>人工费</option>
                  <option value="crgf"><%=dzbjgjmc%>人工费</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="rgf1" size="30" readonly="true">
                <input type="button"  value="修改" onClick="f_rgf(selectform)" name="button9">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">修改公式：</td>
              <td width="53%"> 
                <select name="cly">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="rgf"><%=dzbjzjmc%>人工费</option>
                  <option value="brgf"><%=dzbjzgjmc%>人工费</option>
                  <option value="crgf"><%=dzbjgjmc%>人工费</option>
                </select>
                <input type="text" name="cl" size="11">
                <input type="button"  value="增加" onClick="rgf1.value+=cly.value+cl.value" name="button">
              </td>
            </tr>
          </table>
		  <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">修改机械费</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">被修改机械费
                <select name="jjf" onChange="jjf1.value=''">
                  <option value=""></option>
                  <option value="jjf"><%=dzbjzjmc%>机械费</option>
                  <option value="bjjf"><%=dzbjzgjmc%>机械费</option>
                  <option value="cjjf"><%=dzbjgjmc%>机械费</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="jjf1" size="30" readonly="true">
                <input type="button"  value="修改" onClick="f_jjf(selectform)" name="button13">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">修改公式：</td>
              <td width="53%"> 
                <select name="cl2">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="jjf"><%=dzbjzjmc%>机械费</option>
                  <option value="bjjf"><%=dzbjzgjmc%>机械费</option>
                  <option value="cjjf"><%=dzbjgjmc%>机械费</option>
                </select>
                <input type="text" name="jl" size="11">
                <input type="button"  value="增加" onClick="jjf1.value+=cl2.value+jl.value" name="button">
              </td>
            </tr>
          </table>
		   <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">修改管理费百分比</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">管理费百分比
                <select name="glfbl" onChange="glfbl1.value=''">
                  <option value=""></option>
                  <option value="glfbl"><%=dzbjzjmc%>管理费百分比</option>
                  <option value="bglfbl"><%=dzbjzgjmc%>管理费百分比</option>
                  <option value="cglfbl"><%=dzbjgjmc%>管理费百分比</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="glfbl1" size="30" readonly="true">
                <input type="button"  value="修改" onClick="f_glfbl(selectform)" name="button14">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">修改公式：</td>
              <td width="53%"> 
                <select name="cl3">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="glfbl"><%=dzbjzjmc%>管理费百分比</option>
                  <option value="bglfbl"><%=dzbjzgjmc%>管理费百分比</option>
                  <option value="cglfbl"><%=dzbjgjmc%>管理费百分比</option>
                </select>
                <input type="text" name="jl2" size="11">
                <input type="button"  value="增加" onClick="glfbl1.value+=cl3.value+jl2.value" name="button">
              </td>
            </tr>
          </table>
		  <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">修改利润百分比</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" height="2" align="right">利润百分比
                <select name="lrbl" onChange="lrbl1.value=''">
                  <option value=""></option>
                  <option value="lrbl"><%=dzbjzjmc%>利润百分比</option>
                  <option value="blrbl"><%=dzbjzgjmc%>利润百分比</option>
                  <option value="clrbl"><%=dzbjgjmc%>利润百分比</option>
                </select>
                = </td>
              <td width="53%" height="2"> 
                <input type="text" name="lrbl1" size="30" readonly="true">
                <input type="button"  value="修改" onClick="f_lrbl(selectform)" name="button15">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="47%" align="right">修改公式：</td>
              <td width="53%"> 
                <select name="cl4">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="lrbl"><%=dzbjzjmc%>利润百分比</option>
                  <option value="blrbl"><%=dzbjzgjmc%>利润百分比</option>
                  <option value="clrbl"><%=dzbjgjmc%>利润百分比</option>
                </select>
                <input type="text" name="jl5" size="11">
                <input type="button"  value="增加" onClick="lrbl1.value+=cl4.value+jl5.value" name="button">
              </td>
            </tr>
          </table>
          <table width="59%" border="1" style="FONT-SIZE:14" >
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">全部替换工艺材料</div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="40%" align="right" height="38" bgcolor="#CCFFFF"> 
                <div align="right">被修改工艺材料 </div>
              </td>
              <td width="60%" height="38"> 
                <select name="xzgycl"  style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="a"><%=dzbjzjmc%>工艺材料</option>
                  <option value="b"><%=dzbjzgjmc%>工艺材料</option>
                  <option value="c"><%=dzbjgjmc%>工艺材料</option>
                  <option value="all">全部工艺材料</option>
                </select>
              </td>
            </tr>
            <tr valign="middle" bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="38"> 
                <div align="center">新工艺材料 
                  <textarea name="gycl" cols="77" rows="8"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="修改" onClick="f_gycl(selectform)" name="button22">
                  <input type="reset"  value="重输" name="reset2">
                </div>
              </td>
            </tr>
          </table>
          <table width="59%" border="1"  style="FONT-SIZE:14">
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center">部分替换工艺材料</div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="50%" align="right" height="38">被替换工艺材料</td>
              <td width="50%" height="38"> 
                <select name="bfxzgycl"  style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="a"><%=dzbjzjmc%>工艺材料</option>
                  <option value="b"><%=dzbjzgjmc%>工艺材料</option>
                  <option value="c"><%=dzbjgjmc%>工艺材料</option>
                  <option value="all">全部工艺材料</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="50%" align="right" height="38"> 
                <div align="center">被替换字符 
                  <textarea name="oldgycl" cols="36" rows="3"></textarea>
                </div>
              </td>
              <td width="50%" height="38"> 
                <div align="center">替换后字符 
                  <textarea name="newgycl" cols="36" rows="3"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="修改" onClick="f_bfgycl(selectform)" name="button2">
                  <input type="reset"  value="重输" name="reset">
                </div>
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
function f_rgf(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.rgf)=="") {
		alert("请输入[选择需修改价格]！");
		FormName.rgf.focus();
		return false;
	}
	if(	javaTrim(FormName.cly)=="") {
		alert("请输入[价格修改公式]！");
		FormName.cly.focus();
		return false;
	}

	FormName.action="Updatergf.jsp";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrbl)=="") {
		alert("请输入[选择需修改价格]！");
		FormName.lrbl.focus();
		return false;
	}
	if(	javaTrim(FormName.cl4)=="") {
		alert("请输入[价格修改公式]！");
		FormName.cl4.focus();
		return false;
	}

	FormName.action="Updatelrbl.jsp";
	FormName.submit();
	return true;
}
function f_glfbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.glfbl)=="") {
		alert("请输入[选择需修改价格]！");
		FormName.glfbl.focus();
		return false;
	}
	if(	javaTrim(FormName.cl3)=="") {
		alert("请输入[价格修改公式]！");
		FormName.cl3.focus();
		return false;
	}

	FormName.action="Updatglfb.jsp";
	FormName.submit();
	return true;
}
function f_jjf(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jjf)=="") {
		alert("请输入[选择需修改价格]！");
		FormName.jjf.focus();
		return false;
	}
	if(	javaTrim(FormName.cl2)=="") {
		alert("请输入[价格修改公式]！");
		FormName.cl2.focus();
		return false;
	}

	FormName.action="Updatejjf.jsp";
	FormName.submit();
	return true;
}
function f_jg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jgzd)=="") {
		alert("请输入[选择需修改价格]！");
		FormName.jgzd.focus();
		return false;
	}
	if(	javaTrim(FormName.jggs)=="") {
		alert("请输入[价格修改公式]！");
		FormName.jggs.focus();
		return false;
	}

	FormName.action="UpdateTj.jsp";
	FormName.submit();
	return true;
}
function f_clf(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clfzd)=="") {
		alert("请输入[被修改材料费 ]！");
		FormName.clfzd.focus();
		return false;
	}
	if(	javaTrim(FormName.clfgs)=="") {
		alert("请输入[材料费修改公式]！");
		FormName.clfgs.focus();
		return false;
	}

	FormName.action="UpdateClf.jsp";
	FormName.submit();
	return true;
}
function f_clyl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clylzd)=="") {
		alert("请输入[修改材料用量 ]！");
		FormName.clylzd.focus();
		return false;
	}
	if(	javaTrim(FormName.clylgs)=="") {
		alert("请输入[材料用量修改公式]！");
		FormName.clylgs.focus();
		return false;
	}

	FormName.action="UpdateClyl.jsp";
	FormName.submit();
	return true;
}
function f_gycl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xzgycl)=="") {
		alert("请输入[被修改工艺材料]！");
		FormName.xzgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.gycl)=="") {
		alert("请输入[新工艺材料]！");
		FormName.gycl.focus();
		return false;
	}

	FormName.action="UpdateGycl.jsp";
	FormName.submit();
	return true;
}
function f_bfgycl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bfxzgycl)=="") {
		alert("请输入[被替换工艺材料]！");
		FormName.bfxzgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.oldgycl)=="") {
		alert("请输入[被替换]！");
		FormName.oldgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.newgycl)=="") {
		alert("请输入[替换后]！");
		FormName.newgycl.focus();
		return false;
	}

	FormName.action="UpdateBfGycl.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
