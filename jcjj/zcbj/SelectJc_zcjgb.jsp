<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String dwbh=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%" height="705">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="680" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
                <BR><BR> 
                  <input type="button"  value="����ȫ�����۵���ʱ��" onClick="f_back(selectform)">
                  <input type="button"  value="����������������" onClick="f_dc(selectform)" name="button" >
                <BR><BR> 
                  <input type="button"  value="���������ı��ۣ�Excel��" onClick="f_drnewExcel(selectform)" >
                  <input type="button"  value="���������ı��ۣ�txt��" onClick="f_drnewTxt(selectform)" >
                  <input type="button"  value="ɾ��[Ʒ�ƹ�Ӧ��]����" onClick="f_del(selectform)">
                <BR><BR> 
				<A HREF="���ı���.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<A HREF="���ı���.txt"><B>����Ҽ����Ϊ������Txt����ģ��</B></A>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">��������</font></td>
              <td width="32%"> 
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
              <td width="16%" align="right">�ͺ��Ƿ�ģ����ѯ</td>
              <td width="34%"> 
                <input type="radio" name="mhcx" value="Y" checked>
                ģ����ѯ 
                <input type="radio" name="mhcx" value="N">
                ��ȷ��ѯ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">�ͺ�</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)">              </td>
              <td rowspan="10" align="center" bgcolor="#CCCCFF" width="16%"> 
                <p>��ѡ�ͺ�</p>
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button4" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button22" >
                </p>              </td>
              <td rowspan="10" bgcolor="#CCCCFF" width="34%"> 
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
              <td width="18%" align="right">���Ĵ���</td>
              <td width="32%"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;dwbhMark=0;dwbh.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����С��</td>
              <td width="32%"><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;dwbhMark=0;dwbh.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>Ʒ�ƹ�Ӧ��</b></font></td>
              <td width="32%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('dwbh')">
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
              <td><select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">Ʒ�ƹ�Ӧ��</td>
              <td width="32%"><input type="text" name="dwbh2" size="14" maxlength="50" >
��ģ����ѯ��</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right">Ʒ������</td>
              <td><input type="text" name="ppmc2" size="14" maxlength="50" >
��ģ����ѯ�� </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��Ӧ������</td>
              <td width="32%"><input type="text" name="gys2" size="14" maxlength="50" >
��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ı���</td>
              <td><input type="text" name="jc_zcjgb_zcbm" size="20" maxlength="7" ></td>
              <td align="right">��������</td>
              <td><input type="text" name="jc_zcjgb_zcmc" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���/ϵ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="zclbbm" value="" size="20" maxlength="100" >              </td>
              <td width="16%"> 
                <div align="right">���</div>              </td>
              <td width="34%"> 
                <input type="text" name="jc_zcjgb_gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ɫ</div>              </td>
              <td width="32%"> 
                <input type="text" name="zcysbm" value="" size="20" maxlength="100" >              </td>
              <td width="16%"> 
                <div align="right">������λ</div>              </td>
              <td width="34%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�г���� ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >              </td>
              <td width="16%"> 
                <div align="right">��</div>              </td>
              <td width="34%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�����޼� ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_yhj" size="20" maxlength="9" >              </td>
              <td width="16%"> 
                <div align="right">��</div>              </td>
              <td width="34%"> 
                <input type="text" name="jc_zcjgb_yhj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ�������</div>              </td>
              <td width="32%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+����&N+������","");
%> </td>
              <td width="16%"> 
                <div align="right">��Ƭ����</div>              </td>
              <td width="34%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������� ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >              </td>
              <td width="16%"> 
                <div align="right">��</div>              </td>
              <td width="34%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ƿ��д���</td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���","");
%></td>
              <td width="16%" align="right">�Ƿ��л�</td>
              <td width="34%"> 
                <input type="radio" name="sfyh" value="Y">
                �л� 
                <input type="radio" name="sfyh" value="N">
                �޻�</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������ʼʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" size="20" maxlength="10" >              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="cxkssj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="cxjzsj" size="20" maxlength="10" >              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="cxjzsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�������� ��</td>
              <td width="32%"> 
                <input type="text" name="cxhdbl" size="10" maxlength="10" >
                % </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="cxhdbl2" size="10" maxlength="10" >
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">¼�벿��</td>
              <td width="32%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
                </select>              </td>
              <td width="16%" align="right">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�������</td>
              <td colspan="3"> 
                <select name="jgpx" style="FONT-SIZE:14PX;WIDTH:515PX">
                  <option value=""></option>
                  <option  value="jc_zcjgb.sftjcp desc">�Ƿ��Ƽ���Ʒ</option>
                  <option  value="jc_zcjgb.zcbm">���ı���</option>
                  <option  value="jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.zcbm">����,Ʒ��,���ϵ�У��ͺ�</option>
                  <option  value="jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">����,Ʒ��,���ϵ�У��ͺţ����</option>
                  <option  value="jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">����,Ʒ�ƣ��ͺţ����</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">�ͺţ����</option>
                  <option  value="jc_zcjgb.xh,jc_zcjgb.zcbm">�ͺ�</option>
                  <option  value="jc_zcjgb.zcmc">��������</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="200">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">              </td>
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
	cf.ajax(out);//����AJAX
%>

var gysMark=0;
var dwbhMark=0;
var ppmcMark=0;
var zcxlbmMark=0;

var fieldName="";

function changeDq(FormName) 
{
	gysMark=0;
	dwbhMark=0;
	ppmcMark=0;

	FormName.gys.length=1;
	FormName.dwbh.length=1;
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

	if (lx=="gys")
	{
		if (gysMark==0)
		{
			if (selectform.zcxlbm.value!="")
			{
				sql="select distinct sq_gysxx.gys from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.zcxlbm.value+"' order by sq_gysxx.gys";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select distinct sq_gysxx.gys from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"') order by sq_gysxx.gys";
			}
			else
			{
				sql="select distinct sq_gysxx.gys from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.gys";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="dwbh")
	{
		if (dwbhMark==0)
		{

			if (selectform.zcxlbm.value!="")
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.zcxlbm.value+"' order by sq_gysxx.gysmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"') order by sq_gysxx.gysmc";
			}
			else
			{
				sql="select sq_gysxx.gysmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' order by sq_gysxx.gysmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			dwbhMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.zcxlbm.value!="")
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+selectform.zcxlbm.value+"' order by sq_gysxx.ppmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select distinct sq_gysxx.ppmc from sq_gysxx where dqbm='"+selectform.dqbm.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb in(select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"') order by sq_gysxx.ppmc";
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

	if (lx=="zcxlbm")
	{
		if (zcxlbmMark==0)
		{
			if (selectform.zcdlbm.value=="")
			{
				zcxlbmMark=0;
				selectform.zcdlbm.focus();
				alert("��ѡ�����Ĵ��ࡿ");
				return;
			}

			sql =" select zcxlmc from jdm_zcxlbm where zcdlmc='"+selectform.zcdlbm.value+"' order by zcxlbm";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			zcxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="dwbh")
	{
		strToItem2(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="zcxlbm")
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
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
	if(!(isFloat(FormName.jc_zcjgb_yhj, "�Żݼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj2, "�Żݼ�"))) {
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

	FormName.target="";
	FormName.action="Jc_zcjgbList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ�������ı�����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}
		if(!(isFloat(FormName.cxhdbl, "��������"))) {
			return false;
		}
		if(!(isFloat(FormName.cxhdbl2, "��������"))) {
			return false;
		}

		FormName.target="_blank";
		FormName.action="ExpData.jsp";
		FormName.submit();
		return true;
	}
}
function f_back(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ���ݱ��۱���?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="DbToBack.jsp";
		FormName.submit();
		return true;
	}
}
function f_restore(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ��ԭ���ݱ�����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ChooseBack.jsp";
		FormName.submit();
		return true;
	}
}

function f_drall(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ[�滻ȫ�����ı���]��?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ImpData.jsp";
		FormName.submit();
		return true;
	}
}
function f_drnewExcel(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[Ʒ�ƹ�Ӧ��]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ImpAddData.jsp";
	FormName.submit();
	return true;

}
function f_drnewTxt(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[Ʒ�ƹ�Ӧ��]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ImpAddDataTxt.jsp";
	FormName.submit();
	return true;

}
function f_gx(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ�������ı�����?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.dqbm.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="UpdateData.jsp";
		FormName.submit();
		return true;
	}
}

function f_del(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[Ʒ�ƹ�Ӧ��]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ChooseDel.jsp";
	FormName.submit();
	return true;

}


//-->
</SCRIPT>
