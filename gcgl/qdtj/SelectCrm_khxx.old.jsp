<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");


//检查是否做期末结转
//返回： -1:出错;0:已全部结转；1:只是最近一月未结转;2:至少最近两月未结转
int count=cf.checkYjQmjz("cw_qmjz");

if (count==1)
{
	out.println("错误！最近一月未结转！");
	return;
}
else if (count==2)
{
	out.println("至少最近两月未结转！");
	return;
}
else if (count==-1)
{
	out.println("出错！");
	return;
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">签单客户--维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="buildSelect(this.value, 'selB')">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">合同号</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="34%">
                <input type="text" name="khxm2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">所属城区</div>
              </td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">设计师</div>
              </td>
              <td width="34%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">小区/街道</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="34%"> 
                <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">签约客户</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">联系方式</td>
              <td width="33%">
                <input type="text" name="lxfs" size="20" maxlength="50" >
              </td>
              <td width="16%" align="right">派单状态</td>
              <td width="34%"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">申请派单</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">信息录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">开工时间</div>
              </td>
              <td width="34%"> 
                <input type="radio" name="kgsjqd" value="Y">
                已确定 
                <input type="radio" name="kgsjqd" value="N">
                未确定 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约日期 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到&nbsp;</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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

var xmlHttp;        //用于保存XMLHttpRequest对象的全局变量

//用于创建XMLHttpRequest对象
function createXmlHttp() 
{
    //根据window.XMLHttpRequest对象是否存在使用不同的创建方式
    if(window.XMLHttpRequest)
		{ //Mozilla 浏览器
			xmlHttp = new XMLHttpRequest();
		}
		else if (window.ActiveXObject)
		{
			// IE浏览器
			try
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e)
			{
				try
				{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
				}
			}
		}
}



//获取列表选项的调用函数
function buildSelect(selectedId, targetId) {
    if (selectedId == "") {                             //selectedId为空串表示选中了默认项
		clearSubSel(targetId);                          //清除目标列表及下级列表中的选项
        return;                                         //直接结束函数调用，不必向服务器请求信息
    }
    targetSelId = targetId;                             //将传入的目标列表id赋值给targetSelId变量
	
	createXmlHttp();                                    //创建XmlHttpRequest对象
	xmlHttp.onreadystatechange = buildSelectCallBack;   //设置回调函数
	xmlHttp.open("GET", "select_menu.jsp?selectedId=" + selectedId, true);
    xmlHttp.send(null);

}



//获取列表选项的回调函数
function buildSelectCallBack() {
    //alert("回调");
    if (xmlHttp.readyState == 4) 
	{	//alert("响应已经全部得到");
		//alert(xmlHttp.status);
		if(xmlHttp.status == 200){
			var optionsInfo = xmlHttp.responseText.split(",");			//将服务器数据转换为数组
			var targetSelNode = document.getElementById(targetSelId);
			clearSubSel(targetSelId);                                    //清除目标列表中的选项
			//遍历对象直接量中的成员
			for(var i=0;i<optionsInfo.length;i++){
				//alert(optionsInfo[i]);
				getString=optionsInfo[i].split(":");
				//alert(getString[0]);
				//alert(getString[1]);
				targetSelNode.appendChild(createOption(getString[0], getString[1])); //在目标列表追加新的选项
			}
		}
		else
		{	
			alert("响应失败！");
		}
    }
}







function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
