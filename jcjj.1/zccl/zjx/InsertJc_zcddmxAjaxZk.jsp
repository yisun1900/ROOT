<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String dqbm=request.getParameter("dqbm");

	String clzt=cf.executeQuery("select clzt from jc_zczjx where zjxbh='"+zjxbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>提醒，不能再进行修改！增减项单已完成");
		return;
	}
%>

<body bgcolor="#FFFFFF" onLoad="selectform.srxh.select()" style="FONT-SIZE:14" >

<form method="post" action="" name="selectform" target="_blank">


  <table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF" style="FONT-SIZE:12;HEIGHT:26"> 
      <td > 
  		输入型号<img src="/images/168.gif" > 
		<input type="text" name="srxh" id="txt" size="50" maxlength="100" style='position:absolute; WIDTH:300;left:335; top:20; z-index:2' onKeyUp="changheIn(selectform);">
		<div style='position:absolute; WIDTH:300; left: 335; top:40; z-index:2' id='cen'> 
        <select name="xhlist" id="sel" style="FONT-SIZE:12px;WIDTH:100%;display:none" size="20" onKeyUp="changeItem(selectform,this)" onclick ="selectCk(selectform,this)">
        </select></div>
      </td>
    </tr>
    
        
  </table>


          
  <table width="100%" border="0" name="firsttable" id="firsttable" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#0000CC">主材编码</font></td>
      <td width="79%" id="clbm"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">供应商</font></td>
      <td width="79%" id="gys"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">主材名称</font></td>
      <td width="79%" id="clmc"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">型号</font></td>
      <td width="79%" ><div id="xh"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#0000CC">类别/系列</font>      </td>
      <td width="79%"><div id="cllbbm"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF" id="pj" style="display:none;"> 
      <td width="21%" align="right"><font color="#0000CC">配件</font></td>
      <td width="79%"><div id="sfbhpjmc"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">销售价</font></td>
      <td width="79%"><div id="yhj"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF" id="cxqk" style="display:none;"> 
      <td width="21%" align="right"><font color="#CC0000">促销情况</font></td>
      <td width="79%"><div id="sfycxmc"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" id="cxq" style="display:none;"> 
      <td width="21%" align="right"><font color="#CC0000">促销期</font></td>
      <td width="79%"><div id="cxkssj"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">备注</font></td>
      <td width="79%"><div id="bz"></div></td>
    </tr>




    <tr bgcolor="#E8E8FF" align="center"> 
      <td colspan="2" height="22"><b>录入单品明细</b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" bgcolor="#FFFFCC" align="right"><font color="#FF0000">*</font>选择价格</td>
      <td width="79%"> 
        <INPUT type="radio" name="xzjg" id="xzjg" value="1" CHECKED >
        销售价 
        <INPUT type="radio" name="xzjg" value="2">
        促销价&nbsp;&nbsp;<font color="#0000CC">折前实销价</font> 
        <input type="text" name="zqdj" size="8" maxlength="16"  value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>折扣率</td>
      <td><input type="text" name="dpzk" size="10" maxlength="8"  value="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="f_jsjg(selectform)" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#0000CC">折后实销价</font>
        <input type="text" name="dj" size="8" maxlength="16"  value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right" bgcolor="#FFFFCC">颜色      </td>
      <td width="79%"> 
        <input type="text" name="zcysbm" size="20" maxlength="50"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcpzwzbm)" >      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">铺装位置</td>
      <td width="79%"> 
        <select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz","");
					%>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right"><font color="#FF0000">*</font>订货数量</td>
      <td width="79%"> 
        <input type="text" name="sl" size="10" maxlength="8"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="f_jsjg(selectform)" onKeyUp="keyGo(ycf)">
        <input type="text" name="jldwbm" size="6" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
		 
		 &nbsp;&nbsp;<font color="#0000CC">原材料费</font> 
        <input type="text" name="zqje" size="12" maxlength="16"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right" bgcolor="#E8E8FF">远程费</td>
      <td width="79%"> 
        <input type="text" name="ycf" size="10" maxlength="9"  value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(qtfy[0])">
        元 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#0000CC">折后材料费</font>
        <input type="text" name="je" size="12" maxlength="16"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right"><font color="#FF0000">*</font>其它费用</td>
      <td width="79%"><%
	cf.radioToken(out, "qtfy","1+安装费&2+加工费&3+其它收费&W+无","W");
%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">其它费金额</td>
      <td width="79%"> 
        <input type="text" name="qtfyje" size="10" maxlength="9"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(bc)">
        元 &nbsp;&nbsp;<font color="#0000CC">参加促销活动情况如下<b>↓↓</b></font> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right"><font color="#0000CC">计入比率</font></td>
      <td width="79%"> 
        <input type="text" name="cxhdbl" id="cxhdbl2" size="10" maxlength="9"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
        % &nbsp;&nbsp;&nbsp;<font color="#0000CC">计入金额</font> 
        <input type="text" name="cxhdje" size="12" maxlength="16"  value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right"><strong><font color="#FF0000">*</font></strong>是否赠品</td>
      <td><%
	cf.radioToken(out, "sfzp","Y+是&N+否","N");
%>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#FF0000">*</font>赠送单价
		<input type="text" name="zsdj" size="8" maxlength="16"  value="0"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >  
	  </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right">备注</td>
      <td width="79%"> 
        <textarea name="bz" cols="42" rows="2"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
		<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
		<input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
		<input type="hidden" name="clbm"  value="" >
		<input type="hidden" name="cbj"  value="" >
		<input type="hidden" name="jsbl"  value="" >
		  <input type="button"  value="保存" name="bc" id="bc" onClick="f_do2(selectform)">
          <input type="reset"  value="重输">
        </div>      </td>
    </tr>
  </table>
</form>	<td></td>
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

var ajaxlx;
var xhsz;
var xhsz2;
var len;
var clbm;

var oldtext;

var mark="";

//动态改变下拉框的位置，使它保持居中
function Alors()
{
	document.getElementById("txt").style.left=(document.body.clientWidth-300)/2;
	document.getElementById("cen").style.left=document.getElementById("txt").style.left;
}

Time=window.setInterval("Alors()",10);

//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
	selectform.xhlist.style.display='none';
}


function getAjax(ajaxRetStr) 
{
	//去除前面的换行符
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	//生成下拉框
	if(ajaxlx==1)
	{
		selectform.xhlist.length=0;

		if (ajaxRetStr!="")
		{
			xhsz=ajaxRetStr.split("^");
			len=xhsz.length;

			selectform.xhlist.style.display='block';

			for(var i=0;i<len;i++)
			{
				selectform.xhlist.size=len;

				var pos=xhsz[i].indexOf("~");
				var lsvalue=xhsz[i].substring(0,pos);
				var lstext=xhsz[i].substring(pos+1,xhsz[i].length);

				var op1=document.createElement("option");
				op1.value=lsvalue;
				op1.text=lstext;
				selectform.xhlist.add(op1);
			}
		}
		else{
			selectform.xhlist.style.display='none';
		}
	}
	else{//取主材价格表数据
		xhsz2=ajaxRetStr.split("+");

		//单品显示信息开始＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
		document.getElementById('clbm').innerHTML="";
		txtNode=document.createTextNode(xhsz2[1]+xhsz2[29]);//主材编码
		document.getElementById('clbm').appendChild(txtNode);
		selectform.clbm.value=xhsz2[1];

		document.getElementById('gys').innerHTML="";
		txtNode=document.createTextNode(xhsz2[21]);//供应商
		document.getElementById('gys').appendChild(txtNode);

		document.getElementById('clmc').innerHTML="";
		txtNode=document.createTextNode(xhsz2[3]);//主材名称
		document.getElementById('clmc').appendChild(txtNode);

		document.getElementById('xh').innerHTML="";
		txtNode=document.createTextNode(xhsz2[5]+"(规格："+xhsz2[6]+")");//型号
		document.getElementById('xh').appendChild(txtNode);

		document.getElementById('cllbbm').innerHTML="";
		txtNode=document.createTextNode(xhsz2[4]+"(计入活动比例:"+xhsz2[14]+"%)");//类别/系别
		document.getElementById('cllbbm').appendChild(txtNode);

		if(xhsz2[8]=="Y")//是否包含配件
		{
			document.getElementById('pj').style.display="block";
			document.getElementById('sfbhpjmc').innerHTML="";
			txtNode=document.createTextNode(xhsz2[9]+"(数量："+xhsz2[10]+")");//配件
			document.getElementById('sfbhpjmc').appendChild(txtNode);
		}
		else{
			document.getElementById('pj').style.display="none";
		}

		if(xhsz2[15]=="Y")//是否有促销
		{
			document.getElementById('cxqk').style.display="block";
			document.getElementById('cxq').style.display="block";
			document.getElementById('sfycxmc').innerHTML="";
			txtNode=document.createTextNode(xhsz2[16]+"(促销价："+xhsz2[17]+";计入活动比例："+xhsz2[20]+"%)");//促销情况
			document.getElementById('sfycxmc').appendChild(txtNode);
			document.getElementById('cxkssj').innerHTML="";
			txtNode=document.createTextNode(xhsz2[18]+"(到)"+xhsz2[19]);//促销期
			document.getElementById('cxkssj').appendChild(txtNode);
		}
		else{
			document.getElementById('cxqk').style.display="none";
			document.getElementById('cxq').style.display="none";
		}

		document.getElementById('yhj').innerHTML="";
		txtNode=document.createTextNode(xhsz2[13]+"(市场标价:"+xhsz2[12]+")");//销售限价
		document.getElementById('yhj').appendChild(txtNode);

		document.getElementById('bz').innerHTML="";
		txtNode=document.createTextNode(xhsz2[22]);//备注
		document.getElementById('bz').appendChild(txtNode);

		//单品显示信息完成＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

		//初始化[录入单品明细]
		//xhsz2[24]:选择价格，0:手写项目；1:销售限价；2:促销价 
		//xhsz2[25]:是否有促销,N：没促销；Y：有促销
		if ( xhsz2[24]=="2")
		{
			document.all.xzjg[0].disabled=true;
			document.all.xzjg[1].disabled=false;
			document.all.xzjg[1].checked=true;

			/*
			selectform.xzjg[0].onclick=
				function()
				{
					selectform.dj.value=xhsz2[13];
					selectform.cxhdbl.value=xhsz2[14];
					selectform.cbj.value=xhsz2[0];
					f_jsjg(selectform);
				}
			selectform.xzjg[1].onclick=
				function()
				{
					selectform.dj.value=xhsz2[17];
					selectform.cxhdbl.value=xhsz2[20];
					selectform.cbj.value=xhsz2[2];
					f_jsjg(selectform);
				}
			*/

		}
		else
		{
			document.all.xzjg[0].disabled=false;
			document.all.xzjg[1].disabled=true;
			document.all.xzjg[0].checked=true;
		}

		document.all.zqdj.value=xhsz2[26];
		document.all.dj.value=xhsz2[26];
		document.all.zcysbm.value=xhsz2[7];

		document.all.jldwbm.value=xhsz2[11];

		document.getElementById('cxhdbl2').value=xhsz2[23];
		document.all.cbj.value=xhsz2[27];
		document.all.jsbl.value=xhsz2[28];
		document.all.bz.value=xhsz2[22];
	
	}

}

function changheIn(FormName)
{   
	//获取型号列表               
	if(event.keyCode==13)
	{
		selectform.xhlist.style.display='none';

		ajaxlx=2;
		actionStr="/jcjj/zcdd/GetCpxxByAjax.jsp?srxh="+FormName.srxh.value+"&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>";


//		window.open(actionStr);
		openAjax(actionStr);
	}
	else if(event.keyCode==38)
	{
		FormName.xhlist.focus();
		FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
		mark="last";

		oldtext=FormName.srxh.value;

		FormName.clbm.value       =FormName.xhlist.options[FormName.xhlist.length-1].value;
		FormName.srxh.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
	}
	else if(event.keyCode==40)
	{
		FormName.xhlist.focus();
		FormName.xhlist.options[0].selected=true;
		mark="first";

		oldtext=FormName.srxh.value;

		FormName.clbm.value       =FormName.xhlist.options[0].value;
		FormName.srxh.value=FormName.xhlist.options[0].text;
	}
	else{
		if(FormName.srxh.value=="") 
		{
			selectform.xhlist.style.display='none';
			return;
		}

		//获取型号列表
		ajaxlx=1;
		actionStr="/jcjj/zcdd/GetXhListByAjax.jsp?srxh="+FormName.srxh.value+"&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>";
//		window.open(actionStr);
		openAjax(actionStr);  
	}

}                                                                                                                                                       

function changeItem(FormName,field)
{
	if(event.keyCode==38)
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.clbm.value       =field.options[field.selectedIndex].value;
		FormName.srxh.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.clbm.value       ="";
				FormName.srxh.value=oldtext;

				FormName.srxh.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.clbm.value       =field.options[field.selectedIndex].value;
		FormName.srxh.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.clbm.value       ="";
				FormName.srxh.value=oldtext
				FormName.srxh.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)
	{
		selectform.xhlist.style.display='none';

		ajaxlx=2;
		actionStr="/jcjj/zcdd/GetCpxxByAjax.jsp?clbm="+FormName.clbm.value;
//		window.open(actionStr);
		openAjax(actionStr);
	}
}


function selectCk(FormName,field)
{
	selectform.xhlist.style.display='none';

	FormName.clbm.value=field.options[field.selectedIndex].value;
	FormName.srxh.value=field.options[field.selectedIndex].text;
	ajaxlx=2;
	actionStr="/jcjj/zcdd/GetCpxxByAjax.jsp?clbm="+FormName.clbm.value;
//	window.open(actionStr);
	openAjax(actionStr);
}



function f_jsjg(FormName)//参数FormName:Form的名称
{
	var dj=FormName.dpzk.value/10.0*FormName.zqdj.value;
	dj=round(dj,2);
	FormName.dj.value=dj;

	var zqje=FormName.zqdj.value*FormName.sl.value;
	zqje=round(zqje,2);
	FormName.zqje.value=zqje;

	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;

	var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
	cxhdje=round(cxhdje,2);
	FormName.cxhdje.value=cxhdje;
}


function f_do2(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前实销单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前实销单价"))) {
		return false;
	}

	if(	javaTrim(FormName.dpzk)=="") {
		alert("请输入[折扣率]！");
		FormName.dpzk.focus();
		return false;
	}
	if(!(isFloat(FormName.dpzk, "折扣率"))) {
		return false;
	}
	if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.dpzk.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[折后实销单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "折后实销单价"))) {
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订货数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "订货数量"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[订货数量]不能<=0！");
		FormName.sl.select();
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("请输入[折前材料费]！");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "折前材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[折后材料费]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "折后材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("请选择[其它费用]！");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) {
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("请输入[其它费金额]！");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "其它费金额"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[其它费金额]不能为0！");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}


	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("请输入[计入促销活动比率]！");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "计入促销活动比率"))) {
		return false;
	}
	if (FormName.cxhdbl.value<0 || FormName.cxhdbl.value>300)
	{
		alert("[计入促销活动比率]应在0％和300％之间！");
		FormName.cxhdbl.select();
		return false;
	}
	if(	!radioChecked(FormName.sfzp)) {
		alert("请选择[是否赠品]！");
		FormName.sfzp[0].focus();
		return false;
	}
	if (FormName.sfzp[0].checked)
	{
		if (parseFloat(FormName.dj.value)!=0)
		{
			alert("错误！赠品【折后实销单价】应为0");
			FormName.dj.select();
			return false;
		}
		if(	javaTrim(FormName.zsdj)=="") {
			alert("请输入[赠送单价]！");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "赠送单价"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)==0)
		{
			alert("错误！赠品【赠送单价】不能为0");
			FormName.zsdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.dj.value)==0)
		{
			alert("错误！非赠品【折后实销单价】不能为0");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zsdj)=="") {
			alert("请输入[赠送单价]！");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "赠送单价"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)!=0)
		{
			alert("错误！非赠品【赠送单价】应为0");
			FormName.zsdj.select();
			return false;
		}
	}

	FormName.target="tjmain2";
	FormName.action="SaveInsertJc_zcddmxAjax.jsp";
	FormName.submit();

	FormName.zcysbm.value="";
	FormName.zcpzwzbm.value="";
	FormName.dpzk.value="10";
	FormName.sl.value="";
	FormName.srxh.value="";
	FormName.qtfy[3].checked=true;
	FormName.ycf.value="0";
	FormName.qtfyje.value="";
	FormName.cxhdbl.value="";
	FormName.cxhdje.value="0";

	FormName.sfzp[1].checked=true;
	FormName.zsdj.value="0";

	return true;
}
//-->
</SCRIPT>
