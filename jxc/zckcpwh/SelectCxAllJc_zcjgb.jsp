<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_zcjgbCxAllList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">��������</font></td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDq(selectform)" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
                </select>              </td>
              <td width="17%" align="right">�ͺ��Ƿ�ģ����ѯ</td>
              <td width="33%"> 
                <input type="radio" name="mhcx" value="Y" checked>
                ģ����ѯ 
                <input type="radio" name="mhcx" value="N">
                ��ȷ��ѯ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#CCCCFF">�ͺ�</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)">              </td>
              <td rowspan="10" align="center" bgcolor="#CCCCFF"> 
                <p>��ѡ�ͺ�</p>
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button2" >
                </p>              </td>
              <td rowspan="10" bgcolor="#CCCCFF"> 
                <select name="xhlist" size="18" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong><font color="#0000CC">�Ƿ��Ƽ���Ʒ</font></strong></td>
              <td><input type="radio" name="sftjcp" value="Y">
��
  <input type="radio" name="sftjcp" value="N">
��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���Ĵ���</td>
              <td width="33%"><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="clxlbmMark=0;clxlbm.length=1;gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%> 
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����С��</td>
              <td width="33%"><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clxlbm');" onChange="gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC"><b>��Ʒ��</b></font></td>
              <td width="33%"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>Ʒ������</b></font></td>
              <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>��Ӧ������</b></font></td>
              <td><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gysmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">��Ʒ��</td>
              <td width="33%"><input type="text" name="ppmc2" size="14" maxlength="50" >
��ģ����ѯ�� </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right">Ʒ������</td>
              <td><input type="text" name="ppmc2" size="14" maxlength="50" >
��ģ����ѯ�� </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">��Ӧ������</td>
              <td width="33%"><input type="text" name="gysmc2" size="14" maxlength="50" >
��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">���ı���</td>
              <td width="33%"><input type="text" name="jc_zcjgb_clbm" size="20" maxlength="7" ></td>
              <td width="17%" align="right">��������</td>
              <td width="33%"><input type="text" name="jc_zcjgb_clmc" size="20" maxlength="50" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���/ϵ��</div>              </td>
              <td width="33%"> 
                <input type="text" name="cllbbm" size="20" maxlength="100" >              </td>
              <td width="17%"> 
                <div align="right">���</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ɫ</div>              </td>
              <td width="33%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >              </td>
              <td width="17%"> 
                <div align="right">������λ</div>              </td>
              <td width="33%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�г���� ��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >              </td>
              <td width="17%"> 
                <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���ۼ� ��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_xsj" size="20" maxlength="9" >              </td>
              <td width="17%"> 
                <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_xsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�Ƿ�������</div>              </td>
              <td width="33%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+����&N+������","");
%> </td>
              <td width="17%"> 
                <div align="right">��Ƭ����</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">������� ��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >              </td>
              <td width="17%"> 
                <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�Ƿ��д���</td>
              <td width="33%"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���","");
%></td>
              <td width="17%" align="right">�Ƿ��л�</td>
              <td width="33%"> 
                <input type="radio" name="sfyh" value="Y">
                �л� 
                <input type="radio" name="sfyh" value="N">
                �޻�</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">������ʼʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="cxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��������ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�������� ��</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl" size="10" maxlength="10" >
                % </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl2" size="10" maxlength="10" >
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�������</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
                  <option  value="jc_zcjgb.sftjcp desc">�Ƿ��Ƽ���Ʒ</option>
                  <option  value="jc_zcjgb.clbm">���ı���</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.cllbbm,jc_zcjgb.xh,jc_zcjgb.clbm">����,��Ʒ��,���ϵ�У��ͺ�</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.cllbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">����,��Ʒ��,���ϵ�У��ͺţ����</option>
                  <option  value="jc_zcjgb.cldlbm,jc_zcjgb.ppmc,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">����,��Ʒ�ƣ��ͺţ����</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.clbm">�ͺţ����</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.clbm">�ͺ�</option>
                  <option  value="jc_zcjgb.clmc">��������</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

var gysMark=0;
var ppmcMark=0;
var ppmcMark=0;
var clxlbmMark=0;

var fieldName="";

function changeDq(FormName) 
{
	gysMark=0;
	ppmcMark=0;
	ppmcMark=0;

	FormName.gysmc.length=1;
	FormName.ppmc.length=1;
	FormName.ppmc.length=1;
}

function getThis(lx)
{
	if(	javaTrim(selectform.dqbm)=="") {
		alert("��ѡ��[��������]��");
		selectform.dqbm.focus();
		return false;
	}

	var sql;
	fieldName=lx;

	if (lx=="gysmc")
	{
		if (gysMark==0)
		{
			if (selectform.clxlbm.value!="")
			{
				sql="select distinct sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.clxlbm.value+"' order by sq_gysxx.gysmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_clxlbm where zcdlmc='"+selectform.cldlbm.value+"') order by sq_gysxx.gysmc";
			}
			else
			{
				sql="select distinct sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{

			if (selectform.clxlbm.value!="")
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.clxlbm.value+"' order by sq_gysxx.gysmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_clxlbm where zcdlmc='"+selectform.cldlbm.value+"') order by sq_gysxx.gysmc";
			}
			else
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.gysmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			ppmcMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.clxlbm.value!="")
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.clxlbm.value+"' order by sq_gysxx.ppmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_clxlbm where zcdlmc='"+selectform.cldlbm.value+"') order by sq_gysxx.ppmc";
			}
			else
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.ppmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
		}
	}

}


function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="clxlbm")
	{
		if (clxlbmMark==0)
		{
			if (selectform.cldlbm.value=="")
			{
				clxlbmMark=0;
				selectform.cldlbm.focus();
				alert("��ѡ�����Ĵ��ࡿ");
				return;
			}

			sql =" select zcxlmc from jdm_clxlbm where zcdlmc='"+selectform.cldlbm.value+"' order by clxlbm";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			clxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="gysmc")
	{
		strToItem2(selectform.gysmc,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="clxlbm")
	{
		strToItem2(selectform.clxlbm,ajaxRetStr);
	}
}



//���ͺż����б�               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//�س�
	{
		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jc_zcjgb_xh)=="") {
		alert("������[�ͺ�]��");
		FormName.jc_zcjgb_xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.jc_zcjgb_xh.value)!=-1){        
		alert("��[�ͺ�]�ѱ�ѡ��");        
		FormName.jc_zcjgb_xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jc_zcjgb_xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.jc_zcjgb_xh.value;
	FormName.xhlist.add(op1);


	FormName.jc_zcjgb_xh.value="" ;              
	FormName.jc_zcjgb_xh.select() ;              
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.xhlist.options.length-1; i>=0; i--)
	{
		if (FormName.xhlist.options[i].selected)
		{
			FormName.xhlist.remove(i);
		}
	}
	for (var i=0;i<FormName.xhlist.options.length; i++)
	{
		FormName.xhlist.options[i].text=i+1+":"+FormName.xhlist.options[i].value;
	}

}

//�ж��ظ�¼��                                          
  
function isExisted(o,val){//���б����ж�        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value==val) 
			return index;  
		index++;  
	}    
	return -1;    
}        


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}

	for(i=0;i<FormName.xhlist.length;i++){                                                                         
		FormName.xhlist.options[i].selected = true;                                                                         
	}                                                                        

	if(!(isFloat(FormName.jc_zcjgb_lsj, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_lsj2, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_xsj, "�Żݼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_xsj2, "�Żݼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts2, "�������"))) {
		return false;
	}

	if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxkssj2, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl2, "��������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
