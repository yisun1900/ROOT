<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���Ķ�����ϸ</title>
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
		out.println("<BR>���ѣ������ٽ����޸ģ�����������");
		return;
	}
%>

<body bgcolor="#FFFFFF" onLoad="selectform.srxh.select()" style="FONT-SIZE:14" >

<form method="post" action="" name="selectform" target="_blank">


  <table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF" style="FONT-SIZE:12;HEIGHT:26"> 
      <td > 
  		�����ͺ�<img src="/images/168.gif" > 
		<input type="text" name="srxh" id="txt" size="50" maxlength="100" style='position:absolute; WIDTH:300;left:335; top:20; z-index:2' onKeyUp="changheIn(selectform);">
		<div style='position:absolute; WIDTH:300; left: 335; top:40; z-index:2' id='cen'> 
        <select name="xhlist" id="sel" style="FONT-SIZE:12px;WIDTH:100%;display:none" size="20" onKeyUp="changeItem(selectform,this)" onclick ="selectCk(selectform,this)">
        </select></div>
      </td>
    </tr>
    
        
  </table>


          
  <table width="100%" border="0" name="firsttable" id="firsttable" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#0000CC">���ı���</font></td>
      <td width="79%" id="clbm"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">��Ӧ��</font></td>
      <td width="79%" id="gys"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">��������</font></td>
      <td width="79%" id="clmc"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">�ͺ�</font></td>
      <td width="79%" ><div id="xh"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#0000CC">���/ϵ��</font>      </td>
      <td width="79%"><div id="cllbbm"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF" id="pj" style="display:none;"> 
      <td width="21%" align="right"><font color="#0000CC">���</font></td>
      <td width="79%"><div id="sfbhpjmc"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">���ۼ�</font></td>
      <td width="79%"><div id="yhj"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF" id="cxqk" style="display:none;"> 
      <td width="21%" align="right"><font color="#CC0000">�������</font></td>
      <td width="79%"><div id="sfycxmc"></div></td>
    </tr>
    <tr bgcolor="#FFFFFF" id="cxq" style="display:none;"> 
      <td width="21%" align="right"><font color="#CC0000">������</font></td>
      <td width="79%"><div id="cxkssj"></div></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000CC">��ע</font></td>
      <td width="79%"><div id="bz"></div></td>
    </tr>




    <tr bgcolor="#E8E8FF" align="center"> 
      <td colspan="2" height="22"><b>¼�뵥Ʒ��ϸ</b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" bgcolor="#FFFFCC" align="right"><font color="#FF0000">*</font>ѡ��۸�</td>
      <td width="79%"> 
        <INPUT type="radio" name="xzjg" id="xzjg" value="1" CHECKED >
        ���ۼ� 
        <INPUT type="radio" name="xzjg" value="2">
        ������&nbsp;&nbsp;<font color="#0000CC">��ǰʵ����</font> 
        <input type="text" name="zqdj" size="8" maxlength="16"  value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>�ۿ���</td>
      <td><input type="text" name="dpzk" size="10" maxlength="8"  value="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="f_jsjg(selectform)" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#0000CC">�ۺ�ʵ����</font>
        <input type="text" name="dj" size="8" maxlength="16"  value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right" bgcolor="#FFFFCC">��ɫ      </td>
      <td width="79%"> 
        <input type="text" name="zcysbm" size="20" maxlength="50"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcpzwzbm)" >      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">��װλ��</td>
      <td width="79%"> 
        <select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz","");
					%>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right"><font color="#FF0000">*</font>��������</td>
      <td width="79%"> 
        <input type="text" name="sl" size="10" maxlength="8"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="f_jsjg(selectform)" onKeyUp="keyGo(ycf)">
        <input type="text" name="jldwbm" size="6" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
		 
		 &nbsp;&nbsp;<font color="#0000CC">ԭ���Ϸ�</font> 
        <input type="text" name="zqje" size="12" maxlength="16"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right" bgcolor="#E8E8FF">Զ�̷�</td>
      <td width="79%"> 
        <input type="text" name="ycf" size="10" maxlength="9"  value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(qtfy[0])">
        Ԫ 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#0000CC">�ۺ���Ϸ�</font>
        <input type="text" name="je" size="12" maxlength="16"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right"><font color="#FF0000">*</font>��������</td>
      <td width="79%"><%
	cf.radioToken(out, "qtfy","1+��װ��&2+�ӹ���&3+�����շ�&W+��","W");
%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">�����ѽ��</td>
      <td width="79%"> 
        <input type="text" name="qtfyje" size="10" maxlength="9"  value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(bc)">
        Ԫ &nbsp;&nbsp;<font color="#0000CC">�μӴ�����������<b>����</b></font> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right"><font color="#0000CC">�������</font></td>
      <td width="79%"> 
        <input type="text" name="cxhdbl" id="cxhdbl2" size="10" maxlength="9"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>
        % &nbsp;&nbsp;&nbsp;<font color="#0000CC">������</font> 
        <input type="text" name="cxhdje" size="12" maxlength="16"  value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right"><strong><font color="#FF0000">*</font></strong>�Ƿ���Ʒ</td>
      <td><%
	cf.radioToken(out, "sfzp","Y+��&N+��","N");
%>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#FF0000">*</font>���͵���
		<input type="text" name="zsdj" size="8" maxlength="16"  value="0"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >  
	  </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="21%" align="right">��ע</td>
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
		  <input type="button"  value="����" name="bc" id="bc" onClick="f_do2(selectform)">
          <input type="reset"  value="����">
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
	//����Ajax
	cf.ajax(out);
%>

var ajaxlx;
var xhsz;
var xhsz2;
var len;
var clbm;

var oldtext;

var mark="";

//��̬�ı��������λ�ã�ʹ�����־���
function Alors()
{
	document.getElementById("txt").style.left=(document.body.clientWidth-300)/2;
	document.getElementById("cen").style.left=document.getElementById("txt").style.left;
}

Time=window.setInterval("Alors()",10);

//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
	selectform.xhlist.style.display='none';
}


function getAjax(ajaxRetStr) 
{
	//ȥ��ǰ��Ļ��з�
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

	//����������
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
	else{//ȡ���ļ۸������
		xhsz2=ajaxRetStr.split("+");

		//��Ʒ��ʾ��Ϣ��ʼ��������������������������������
		document.getElementById('clbm').innerHTML="";
		txtNode=document.createTextNode(xhsz2[1]+xhsz2[29]);//���ı���
		document.getElementById('clbm').appendChild(txtNode);
		selectform.clbm.value=xhsz2[1];

		document.getElementById('gys').innerHTML="";
		txtNode=document.createTextNode(xhsz2[21]);//��Ӧ��
		document.getElementById('gys').appendChild(txtNode);

		document.getElementById('clmc').innerHTML="";
		txtNode=document.createTextNode(xhsz2[3]);//��������
		document.getElementById('clmc').appendChild(txtNode);

		document.getElementById('xh').innerHTML="";
		txtNode=document.createTextNode(xhsz2[5]+"(���"+xhsz2[6]+")");//�ͺ�
		document.getElementById('xh').appendChild(txtNode);

		document.getElementById('cllbbm').innerHTML="";
		txtNode=document.createTextNode(xhsz2[4]+"(��������:"+xhsz2[14]+"%)");//���/ϵ��
		document.getElementById('cllbbm').appendChild(txtNode);

		if(xhsz2[8]=="Y")//�Ƿ�������
		{
			document.getElementById('pj').style.display="block";
			document.getElementById('sfbhpjmc').innerHTML="";
			txtNode=document.createTextNode(xhsz2[9]+"(������"+xhsz2[10]+")");//���
			document.getElementById('sfbhpjmc').appendChild(txtNode);
		}
		else{
			document.getElementById('pj').style.display="none";
		}

		if(xhsz2[15]=="Y")//�Ƿ��д���
		{
			document.getElementById('cxqk').style.display="block";
			document.getElementById('cxq').style.display="block";
			document.getElementById('sfycxmc').innerHTML="";
			txtNode=document.createTextNode(xhsz2[16]+"(�����ۣ�"+xhsz2[17]+";����������"+xhsz2[20]+"%)");//�������
			document.getElementById('sfycxmc').appendChild(txtNode);
			document.getElementById('cxkssj').innerHTML="";
			txtNode=document.createTextNode(xhsz2[18]+"(��)"+xhsz2[19]);//������
			document.getElementById('cxkssj').appendChild(txtNode);
		}
		else{
			document.getElementById('cxqk').style.display="none";
			document.getElementById('cxq').style.display="none";
		}

		document.getElementById('yhj').innerHTML="";
		txtNode=document.createTextNode(xhsz2[13]+"(�г����:"+xhsz2[12]+")");//�����޼�
		document.getElementById('yhj').appendChild(txtNode);

		document.getElementById('bz').innerHTML="";
		txtNode=document.createTextNode(xhsz2[22]);//��ע
		document.getElementById('bz').appendChild(txtNode);

		//��Ʒ��ʾ��Ϣ��ɣ���������������������������������

		//��ʼ��[¼�뵥Ʒ��ϸ]
		//xhsz2[24]:ѡ��۸�0:��д��Ŀ��1:�����޼ۣ�2:������ 
		//xhsz2[25]:�Ƿ��д���,N��û������Y���д���
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
	//��ȡ�ͺ��б�               
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

		//��ȡ�ͺ��б�
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



function f_jsjg(FormName)//����FormName:Form������
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


function f_do2(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zqdj)=="") {
		alert("������[��ǰʵ������]��");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "��ǰʵ������"))) {
		return false;
	}

	if(	javaTrim(FormName.dpzk)=="") {
		alert("������[�ۿ���]��");
		FormName.dpzk.focus();
		return false;
	}
	if(!(isFloat(FormName.dpzk, "�ۿ���"))) {
		return false;
	}
	if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.dpzk.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[�ۺ�ʵ������]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "�ۺ�ʵ������"))) {
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[��������]����<=0��");
		FormName.sl.select();
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("������[��ǰ���Ϸ�]��");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "��ǰ���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[�ۺ���Ϸ�]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "�ۺ���Ϸ�"))) {
		return false;
	}

	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("��ѡ��[��������]��");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) {
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("������[�����ѽ��]��");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "�����ѽ��"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[�����ѽ��]����Ϊ0��");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}


	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("������[������������]��");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "������������"))) {
		return false;
	}
	if (FormName.cxhdbl.value<0 || FormName.cxhdbl.value>300)
	{
		alert("[������������]Ӧ��0����300��֮�䣡");
		FormName.cxhdbl.select();
		return false;
	}
	if(	!radioChecked(FormName.sfzp)) {
		alert("��ѡ��[�Ƿ���Ʒ]��");
		FormName.sfzp[0].focus();
		return false;
	}
	if (FormName.sfzp[0].checked)
	{
		if (parseFloat(FormName.dj.value)!=0)
		{
			alert("������Ʒ���ۺ�ʵ�����ۡ�ӦΪ0");
			FormName.dj.select();
			return false;
		}
		if(	javaTrim(FormName.zsdj)=="") {
			alert("������[���͵���]��");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "���͵���"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)==0)
		{
			alert("������Ʒ�����͵��ۡ�����Ϊ0");
			FormName.zsdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.dj.value)==0)
		{
			alert("���󣡷���Ʒ���ۺ�ʵ�����ۡ�����Ϊ0");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zsdj)=="") {
			alert("������[���͵���]��");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "���͵���"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)!=0)
		{
			alert("���󣡷���Ʒ�����͵��ۡ�ӦΪ0");
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
