<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>呼叫中心</TITLE>
</HEAD>

<BODY onbeforeunload="closeDeal()"  > 

<div align="center">呼叫中心－－呼出</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center">摘/挂机</td>
    <td height="52"><input type="button" value="摘机" name="zjBT" onClick="zjHMBT()">
        <input type="button" value="挂机" name="gjBT" onClick="gjHMBT()" disabled></td>
  </tr>
  <tr>
    <td width="15%" align="center">拨号</td>
    <td width="85%" height="52"> 呼叫号码：
      <input name="outnum" type="text" value="" size="20" maxlength="20">
        <input type="button" value="拨号" name="DialBT" onClick="DialNmb()" disabled>
        <input name="button2" type="button" onClick="window.open('SelectCxCrm_zxkhxx.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="查找客户" ></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">

//摘机
function zjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		zjBT.disabled=true;

		parent.menu.zjHM();

		gjBT.disabled=false;
		DialBT.disabled=false;
	}
	else{
		alert("错误！未挂机，不能摘机");
		return;
	}
}

//挂机
function gjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==6 || callMark==7 || callMark==13)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		gjBT.disabled=true;

		parent.menu.gjHM();

		zjBT.disabled=false;
	}
	else{
		alert("错误！不能挂机");
		return;
	}
}


//拨号
function DialNmb()
{
	var callMark=parent.menu.callMark;

	if (outnum.value=="")
	{
		alert("错误！请输入呼叫号码");
		outnum.select();
		return;
	}
	else{
		if (callMark!=6 )//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			alert("错误！未摘机");
			return;
		}

		DialBT.disabled=true;

		parent.menu.DialNmb(outnum.value);


	}

}



function closeDeal()
{
	var callMark=parent.menu.callMark;

	if (callMark==6 || callMark==7 || callMark==13)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		parent.menu.gjHM();
	}
}



</SCRIPT>
