<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%

String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");
String zt="4";

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

%>

<body bgcolor="#FFFFFF">
<table width="100%" style='FONT-SIZE: 14px'>
  <tr>
    <td width="100%"> 
      <div align="center">��¼��ɢ�����ĺ�ͬ</div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�ͻ����� </td>
              <td><input type="text" name="khxm" value="" size="20" maxlength="50" onKeyUp="keyTo(xb[0])" ></td>
              <td align="right"><font color="#CC0000">*</font>�Ա� </td>
              <td><input type="radio" name="xb"  value="M" onKeyUp="keyTo(lxfs)">
                ��
                <input type="radio" name="xb"  value="W" onKeyUp="keyTo(lxfs)">
                Ů </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>��ϵ��ʽ</td>
              <td colspan="3"><input type="text" name="lxfs" value="" size="72" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>���ݵ�ַ</td>
              <td colspan="3"><input type="text" name="fwdz" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���Ĵ���</td>
              <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td align="right">����С��</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>Ʒ��</td>
              <td colspan="3">
			  <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX" >
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��������</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qhtsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��ͬ�ͻ�ʱ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>���ĺ�ͬ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="xshth" value="" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>פ��Ҿӹ���</td>
              <td bgcolor="#FFFFFF"><select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
				out.println("<option value=\"\"></option>");

			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" UNION ALL ";
				listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh  and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" ORDER BY c2 ";
				cf.selectItem(out,listSql,yhmc);
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" UNION ALL ";
				listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh  and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" ORDER BY c2 ";
				cf.selectItem(out,listSql,yhmc);
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" UNION ALL ";
				listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" ORDER BY c2 ";
				cf.selectItem(out,listSql,yhmc);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}

%>
              </select></td>
            </tr>
            
			<%--<tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>��������</td>
              <td><input type="text" name="dgkh" value="<%=dgkh%>" size="20" maxlength="20" ></td>
              <td align="right">�տ�ƾ֤��</td>
              <td><input type="text" name="skpzh" value="" size="20" maxlength="20" ></td>
            </tr>--%>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*<strong><font color="#FF00FF">����Ʒ-���Ϸ�</font></strong></font></td>
              <td><input name="zcpclf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><strong><font color="#660099">�ؼ�Ʒ-���Ϸ�</font></strong></td>
              <td><input name="tjpclf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>��װ���ϼӹ���</td>
              <td><input name="qtf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right"><font color="#FF0000">*</font>Զ�̷�</td>
              <td><input name="ycf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">��ͬ�ܶ�</font></td>
              <td colspan="3"><input type="text" name="wdzje" value="" size="20" maxlength="20"  readonly>
              ��ͬ�ܶ����Ʒ���Ϸѣ��ؼ�Ʒ���Ϸѣ���װ���ϼӹ��ѣ�Զ�̷�</td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�ֹ�˾</td>
              <td width="32%">
			  <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼����</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="qddm" value="<%=dwbh%>" >
                <input type="hidden" name="khjl" value="" >
                <input type="hidden" name="jzsjs" value="" >
                <input type="hidden" name="zt" value="<%=zt%>">
                <input type="hidden" name="zqclf" value="0" >

				<input type="hidden" name="xmzy" value="" >
                <input type="hidden" name="jjsjs" value="" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddshbz" value="1" >
                <input type="hidden" name="jhtzshsj" value=""   >
                <input type="hidden" name="dzyy" value="" >
                <input type="hidden" name="kjxsj" value=""  >
                <input type="hidden" name="hkze" value="" size="20" maxlength="20" >
                <input type="hidden" name="zczkl" size="8" maxlength="8" value="10" readonly>
                <input type="hidden" name="htcxhdje" value="0" size="20" maxlength="10" >
                <input type="hidden" name="jmje" value="0" size="20" maxlength="20" >
                <input type="button" name="save"  value="����" onClick="f_do(insertform)">
                <input type="button" name="cl"  value="¼���¶���" onClick="reset();save.disabled=false;cl.disabled=true" disabled></td>
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

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;



function changeDl(FormName)
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�ֹ�˾]��");
		FormName.zcdlbm.value="";
		FormName.fgsbh.focus();
		return;
	}

	czlx=2;

	FormName.zcxlbm.length=1;
	insertform.ycf.readOnly=false;
	insertform.qtf.readOnly=false;

	var sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.zcdlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
//	window.open(actionStr);
}



function getPp(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select distinct jxc_ppxx.ppmc c1,jxc_ppxx.ppmc||DECODE(zcbljs,'Y','����װ���ϼӹ��Ѽ��롾����Ʒ���Ϸѡ���','N','')||DECODE(ycfbl,'Y','��Զ�̷Ѽ��롾����Ʒ���Ϸѡ���','N','') c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
		getPp(insertform);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
}


function f_jsjg(FormName)//����FormName:Form������
{
	var zqclf=0;
	zqclf=FormName.zcpclf.value*1.0+FormName.tjpclf.value*1.0;
	zqclf=round(zqclf,2);
	FormName.zqclf.value=zqclf;
	
	var wdzje=0;
	wdzje=FormName.zqclf.value*1.0+FormName.qtf.value*1.0+FormName.ycf.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;
	
	FormName.hkze.value=FormName.wdzje.value;
	FormName.zczkl.value=10;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}

	
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.qhtsj)=="") {
		alert("������[��������]��");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.htshsj)=="") {
		alert("������[��ͬ�ͻ�ʱ��]��");
		FormName.htshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.xshth)=="") {
		alert("������[���ĺ�ͬ��]��");
		FormName.xshth.focus();
		return false;
	}

	if(	javaTrim(FormName.clgw)=="") {
		alert("������[פ��Ҿӹ���]��");
		FormName.clgw.focus();
		return false;
	}
	
	
	if(	javaTrim(FormName.zcpclf)=="") {
		alert("������[����Ʒ-���Ϸ�]��");
		FormName.zcpclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcpclf, "����Ʒ-���Ϸ�"))) {
		return false;
	}

	if(	javaTrim(FormName.tjpclf)=="") {
		alert("������[�ؼ�Ʒ-���Ϸ�]��");
		FormName.tjpclf.focus();
		return false;
	}

	if(!(isFloat(FormName.tjpclf, "�ؼ�Ʒ-���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqclf)=="") {
		alert("������[���Ϸ�]��");
		FormName.zqclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqclf, "���Ϸ�"))) {
		return false;
	}


	if(	javaTrim(FormName.qtf)=="") {
		alert("������[��װ���ϼӹ���]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "��װ���ϼӹ���"))) {
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

	
	
	if(	javaTrim(FormName.wdzje)=="") {
		alert("������[��ͬ�ܶ�]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "��ͬ�ܶ�"))) {
		return false;
	}

	if (parseFloat(FormName.wdzje.value)==0)
	{
		alert("[��ͬ�ܶ�]����Ϊ0��");
		FormName.zqclf.select();
		return false;
	}


	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="SaveInsertJc_zcdd1.jsp";
	FormName.submit();
	FormName.save.disabled=true;
	FormName.cl.disabled=false;
	return true;

}


//-->
</SCRIPT>
