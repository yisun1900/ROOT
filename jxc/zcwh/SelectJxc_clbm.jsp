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
String ppmc=(String)session.getAttribute("ppmc");
%>

<body bgcolor="#FFFFFF">
<table width="100%" height="705">
  <tr>
    <td width="100%"> 
      <div align="center">���Ŀ��Ʒά��</div>
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
                <input name="button2" type="button" onClick="f_back(selectform)"  value="����ȫ�����۵���ʱ��">
                <input type="button"  value="����������������" onClick="f_dc(selectform)" name="button" >
                <BR><BR> 
                  <input type="button"  value="���������ı��ۣ�Excel��" onClick="f_drnewExcel(selectform)" >
                  <input type="button"  value="���������ı��ۣ�txt��" onClick="f_drnewTxt(selectform)" >
                  <input type="button"  value="ɾ��[��Ʒ��]����" onClick="f_del(selectform)">
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
                <input type="text" name="xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)">              </td>
              <td rowspan="9" align="center" bgcolor="#CCCCFF" width="16%"> 
                <p>��ѡ�ͺ�</p>
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button4" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button22" >
                </p>              </td>
              <td rowspan="9" bgcolor="#CCCCFF" width="34%"> 
                <select name="xhlist" size="18" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���Ĵ���</td>
              <td width="32%"><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="clxlbmMark=0;clxlbm.length=1;gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����С��</td>
              <td width="32%"><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clxlbm');" onChange="gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>��Ʒ��</b></font></td>
              <td width="32%"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000CC"><b>Ʒ������</b></font></td>
              <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('scsmc')">
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
              <td width="18%" bgcolor="#FFFFFF" align="right">��Ʒ��</td>
              <td width="32%"><input type="text" name="ppmc2" size="14" maxlength="50" >
��ģ����ѯ��</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right">Ʒ������</td>
              <td><input type="text" name="scsmc2" size="14" maxlength="50" >
��ģ����ѯ�� </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��Ӧ������</td>
              <td width="32%"><input type="text" name="gysmc2" size="14" maxlength="50" >
��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ڲ�����</td>
              <td><input type="text" name="nbbm" value="" size="20" maxlength="100" ></td>
              <td align="right"><strong><font color="#0000CC">�Ƿ��Ƽ���Ʒ</font></strong></td>
              <td><input type="radio" name="sftjcp" value="Y">
��
  <input type="radio" name="sftjcp" value="N">
��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ı���</td>
              <td><input type="text" name="clbm" size="20" maxlength="7" ></td>
              <td align="right">��������</td>
              <td><input type="text" name="clmc" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���/ϵ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="cllbbm" value="" size="20" maxlength="100" >              </td>
              <td width="16%"> 
                <div align="right">���</div>              </td>
              <td width="34%"> 
                <input type="text" name="gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ɫ</div>              </td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >              </td>
              <td width="16%"> 
                <div align="right">������λ</div>              </td>
              <td width="34%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="lsj" size="20" maxlength="9" >              </td>
              <td width="16%"> 
                <div align="right">��</div>              </td>
              <td width="34%"> 
                <input type="text" name="lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ۼ� ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="xsj" size="20" maxlength="9" >              </td>
              <td width="16%"> 
                <div align="right">��</div>              </td>
              <td width="34%"> 
                <input type="text" name="xsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ�������</div>              </td>
              <td width="32%"><%
	cf.radioToken(out, "sfbhpj","Y+����&N+������","");
%> </td>
              <td width="16%"> 
                <div align="right">��Ƭ����</div>              </td>
              <td width="34%"> 
                <input type="text" name="zp" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������� ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="pjts" size="20" maxlength="8" >              </td>
              <td width="16%"> 
                <div align="right">��</div>              </td>
              <td width="34%"> 
                <input type="text" name="pjts2" size="20" maxlength="8" >              </td>
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
                  <option  value="jxc_clbm.sftjcp desc">�Ƿ��Ƽ���Ʒ</option>
                  <option  value="jxc_clbm.clbm">���ı���</option>
                  <option  value="jxc_clbm.cldlbm,jxc_clbm.ppmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.clbm">����,Ʒ��,���ϵ�У��ͺ�</option>
                  <option  value="jxc_clbm.cldlbm,jxc_clbm.ppmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">����,Ʒ��,���ϵ�У��ͺţ����</option>
                  <option  value="jxc_clbm.cldlbm,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">����,Ʒ�ƣ��ͺţ����</option>
                  <option  value="jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">�ͺţ����</option>
                  <option  value="jxc_clbm.xh,jxc_clbm.clbm">�ͺ�</option>
                  <option  value="jxc_clbm.clmc">��������</option>
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
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_gysxx.gysmc";
			}
			else
			{
				sql="select jxc_gysxx.gysmc from jxc_gysxx where jxc_gysxx.dqbm='"+selectform.dqbm.value+"' order by jxc_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="scsmc")
	{
		if (ppmcMark==0)
		{

			if (selectform.clxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') order by jxc_ppxx.scsmc";
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
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') order by jxc_ppxx.ppmc";
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

			sql =" select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"' order by clxlmc";

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
	else if (fieldName=="scsmc")
	{
		strToItem2(selectform.scsmc,ajaxRetStr);
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
	if(	javaTrim(FormName.xh)=="") {
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.xh.value)!=-1){        
		alert("��[�ͺ�]�ѱ�ѡ��");        
		FormName.xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.xh.value;
	FormName.xhlist.add(op1);


	FormName.xh.value="" ;              
	FormName.xh.select() ;              
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

	if(!(isFloat(FormName.lsj, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.xsj, "�Żݼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.xsj2, "�Żݼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.pjts, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.pjts2, "�������"))) {
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
	FormName.action="Jxc_clbmList.jsp";
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
/*
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
*/
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
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
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
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ChooseDel.jsp";
	FormName.submit();
	return true;

}


//-->
</SCRIPT>
