<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">订单查询
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="ChList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">订单编号</td>
              <td width="31%"> 
              <input type="text" name="FBillNo" size="20" maxlength="20">              </td>
              <td width="19%" align="right">购货单位</td>
              <td width="31%"> 
                <input type="text" name="FModel" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">购货日期</td>
              <td><input type="text" name="FDate" size="20" maxlength="20" onDblClick="JSCalendar(this)"></td>
              <td><div align="right">到</div></td>
              <td><input type="text" name="FDate2" size="20" maxlength="20" onDblClick="JSCalendar(this)"></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"><input type="text" name="clgw" size="20" maxlength="20"></td>
              <td width="19%" align="right">项目专员</td>
              <td width="31%"><input type="text" name="xmzy" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%" bgcolor="#CCCCFF"><input type="text" name="ztjjgw" size="20" maxlength="20" ></td>
              <td width="19%" align="right">订单确认人</td>
              <td width="31%"><input type="text" name="ddqrr" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">订单确认时间 从</td>
              <td width="31%"> 
                <input type="text" name="ddqrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="ddqrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                计划测量时间 从              </td>
              <td width="31%"><input type="text" name="jhclsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="31%"> 
                <input type="text" name="jhclsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">实际测量时间 从</td>
              <td width="31%"> 
                <input type="text" name="sclsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="sclsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">合同送货时间 从</td>
              <td width="31%"> 
                <input type="text" name="htshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="htshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">计划送货时间 从</td>
              <td width="31%"> 
                <input type="text" name="jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">发送货通知时间 从</td>
              <td width="31%"> 
                <input type="text" name="tzshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="tzshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">实送货时间 从</td>
              <td width="31%"> 
                <input type="text" name="sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
           
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.FDate, "购货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.FDate2, "购货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj, "订单确认时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj2, "订单确认时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhclsj, "计划测量时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhclsj2, "计划测量时间"))) {
		return false;
	}
	
	if(!(isDatetime(FormName.sclsj, "实际测量时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sclsj2, "实际测量时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj2, "合同送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj2, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tzshsj, "发送货通知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tzshsj2, "发送货通知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sshsj, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sshsj2, "实送货时间"))) {
		return false;
	}
	

	

	FormName.action="DdList.jsp";
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

