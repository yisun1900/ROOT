<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>Ͷ��֪ͨ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>


<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbmCxList.jsp" name="selectform">
          
        <div align="center">��ѯͶ��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right" >�ֹ�˾</td>
      <td width="32%" >
		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%> 
		</select>	  </td>
      <td width="18%"  align="right">Ͷ�߲���</td>
      <td width="32%" > 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
			if (yhjs.equals("A0"))
			{
				out.println("<option value=\"\"></option>");
			}
			else if (yhjs.equals("F0"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
			}
			%> 
        </select>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF">��ͬ��</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="hth" size="20" maxlength="20">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">�ͻ����</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="khbh" size="20" maxlength="20">      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF">���ʦ</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="sjs" size="20" maxlength="20">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">�ʼ�</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="zjxm" size="20" maxlength="20">      </td>
    </tr>
    <tr>
      <td width="18%" align="right" bgcolor="#FFFFFF">ʩ����</td>
      <td width="32%" bgcolor="#FFFFFF">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
          <option value=""></option>
        </select>      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">ʩ������</td>
      <td width="32%" bgcolor="#FFFFFF">
        <input type="text" name="sgbz" size="20" maxlength="20" >      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000CC"><b>�ͻ�����</b></font></td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="khxm" size="20" maxlength="50">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">�ͻ�����</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"> 
        <font color="#0000CC"><b>��ϵ��ʽ</b></font>      </td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="lxfs" size="20" maxlength="50">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF"> 
        ��ϵ��ʽ     </td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        ��ģ����ѯ�� </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
      <td colspan="3" bgcolor="#FFFFFF"> 
        <input type="text" name="fwdz" size="71" maxlength="100">      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"> 
        ���ݵ�ַ </td>
      <td colspan="3" bgcolor="#FFFFFF"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF" >&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >Ͷ�߼�¼��</td>
      <td ><input type="text" name="tsjlh" size="20" maxlength="10"  ></td>
      <td  align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >Ͷ�ߴ���״̬</td>
      <td >
	  <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <option value="0">δ����</option>
        <option value="1">������</option>
        <option value="4">�ѽ���</option>
        <option value="5">�ѳ��ֳ�</option>
        <option value="6">�ѳ�����</option>
        <option value="7">�������ͨ��</option>
        <option value="2">�ڴ���</option>
        <option value="3">�᰸</option>
      </select>	  </td>
      <td  align="right" bgcolor="#FFFFFF">Ͷ���Ƿ�᰸</td>
      <td >
        <input type="radio" name="sfja" value="Y">�᰸
        <input type="radio" name="sfja" value="N">δ�᰸      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >���β��Ŵ���״̬</td>
      <td ><select name="zrbmclzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <option value="1">δ����</option>
        <option value="2">�ѽ��յȴ�������</option>
        <option value="4">�ѽ��յȴ����ֳ�</option>
        <option value="6">�ѳ��ֳ��ȴ�����</option>
        <option value="7">�ѳ������ȴ����</option>
        <option value="8">�ѳ������������</option>
        <option value="9">�������ͨ��</option>
        <option value="A">�������δͨ��</option>
        <option value="B">�ڴ���</option>
        <option value="3">�ѽ��</option>
        <option value="C">�ط�δ���</option>
        <option value="5">�᰸</option>
      </select></td>
      <td  align="right" bgcolor="#FFFFFF">���β����Ƿ���</td>
      <td >
		<input type="radio" name="sfjj" value="Y">���
        <input type="radio" name="sfjj" value="N">δ���	</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >Ͷ�ߴ���</td>
      <td width="32%" > 
        <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tslxbm')" onChange="tsxlbmMark=0;crm_tsbm_tsxlbm.length=1">
          <option value=""></option>
        </select>      </td>
      <td width="18%"  align="right" bgcolor="#FFFFFF">Ͷ��С��</td>
      <td width="32%" > 
        <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tsxlbm')">
          <option value=""></option>
        </select>      </td>
    </tr>
    <tr bgcolor="#999999"> 
      <td width="18%" bgcolor="#FFFFFF" align="right">Ͷ�߱���Ʒ��</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="crm_tsbm_tspp" size="20" maxlength="50" >      </td>
      <td width="18%" bgcolor="#FFFFFF" align="right">Ͷ�߱���Ʒ��</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="crm_tsbm_tspp2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >�ͷ�����ʱ�� ��</td>
      <td  width="32%"> 
        <input type="text" name="slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right" width="18%">��</td>
      <td  width="32%"> 
        <input type="text" name="slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >¼��ʱ�� ��</td>
      <td  width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right" width="18%">��</td>
      <td  width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" >����ʱ�� ��</td>
      <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >�ƻ����ֳ�ʱ�� ��</td>
      <td><input type="text" name="jhcxcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="jhcxcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >ʵ�ʳ��ֳ�ʱ�� ��</td>
      <td><input type="text" name="sjcxcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="sjcxcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >�ƻ�������ʱ�� ��</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="jhcfasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >ʵ�ʳ�����ʱ�� ��</td>
      <td><input type="text" name="sjcfasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="sjcfasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >�������ʱ�� ��</td>
      <td><input type="text" name="shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >�ƻ����ʱ�� ��</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="jhjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >���´���ʱ�� ��</td>
      <td><input type="text" name="clsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="clsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >ʵ�ʽ��ʱ�� ��</td>
      <td><input type="text" name="sjjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td  align="right">��</td>
      <td><input type="text" name="sjjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >ȷ�Ͻ��ʱ�� ��</td>
      <td><input type="text" name="qrjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">��</td>
      <td><input type="text" name="qrjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" value="����" onClick="f_do(selectform)">
        <input type="reset" value="����">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

var sgdMark=0;
var tslxbmMark=0;
var tsxlbmMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="fgs";

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getThis(lx)
{
	var sql;
	fieldName=lx;

	if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'��'||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��')||'��'||DECODE(sq_sgd.cxbz,'N','','Y','��������') from sq_sgd where ssfgs='"+selectform.fgs.value+"' order by ssfgs,cxbz,sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}
	else if (lx=="tslxbm")
	{
		if (tslxbmMark==0)
		{
			var sql="select tslxbm,tslxmc from dm_tslxbm where tsdl='2' order by tslxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			tslxbmMark=1;
		}
	}
	else if (lx=="tsxlbm")
	{
		if (tsxlbmMark==0)
		{
			if (selectform.crm_tsbm_tslxbm.value=="")
			{
				selectform.crm_tsbm_tslxbm.focus();
				alert("��ѡ��Ͷ�߱��޴��ࡿ");
				return;
			}

			sql="select tsxlbm,tsxlmc from dm_tsxlbm where tslxbm='"+selectform.crm_tsbm_tslxbm.value+"'  order by tsxlbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			tsxlbmMark=1;
		}
		else{
			tsxlbmMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (fieldName=="fgs")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.sgd,ajaxRetStr);
	}
	else if (fieldName=="tslxbm")
	{
		strToSelect(selectform.crm_tsbm_tslxbm,ajaxRetStr);
	}
	else if (fieldName=="tsxlbm")
	{
		strToSelect(selectform.crm_tsbm_tsxlbm,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.slsj, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.slsj2, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjcfasj, "������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjcfasj2, "������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj2, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.clsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.clsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
