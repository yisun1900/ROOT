<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");
String zjxm=yhmc;
if (!zwbm.equals("05"))
{
	zjxm="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��ʩ����--��ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                �ͻ������ֹ�˾              </td>
              <td width="28%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
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
				</select>			  </td>
              <td width="17%" align="right"> 
              ǩԼ����              </td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%> 
                </select>              </td>
            </tr>
			<tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">����С��</td>
              <td width="28%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
                  <option value=""></option>
              </select>              </td>
              <td width="19%" align="right">��ѯ״̬</td>
              <td width="35%">
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">δ�������</option>
                  <option value="1">�������</option>
                  <option value="2">�ɵ����δͨ��</option>
                  <option value="3">��ǩԼ</option>
                  <option value="4">�ɵ�</option>
                  <option value="5">�ɵ����δͨ��</option>
              </select>              </td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �ͻ����              </td>
              <td width="31%"> 
              <input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td width="17%" align="right"> 
              �ͻ�����              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="28%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cqbm')">
                  <option value=""></option>
              </select>              </td>
              <td width="17%" align="right"> 
              ���ݵ�ַ              </td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ��ϵ��ʽ              </td>
              <td width="31%"> 
              <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"> 
              ��ͬ��              </td>
              <td width="33%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                ǩԼ���� ��              </td>
              <td width="31%"> 
              <input type="text" name="qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right"> 
              ��              </td>
              <td width="33%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                Ӧ�������� ��              </td>
              <td width="31%"> 
              <input type="text" name="kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right"> 
              ��              </td>
              <td width="33%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">���齻������ ��</td>
              <td width="31%"> 
              <input type="text" name="jyjdrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jyjdrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ���ʦ              </td>
              <td width="31%"> 
              <input type="text" name="sjs" size="20" maxlength="20" >              </td>
              <td width="17%" align="right" bgcolor="#FFFFFF">�ʼ� </td>
              <td width="33%">
                <input type="text" name="zjxm" value="<%=zjxm%>" size="20" maxlength="20" <% if (!zjxm.equals("")) out.println("readonly");%>>              </td>
			  
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �ص���־              </td>
              <td width="31%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�ǻص�</option>
                  <option value="3">ʩ���ӻص�</option>
                  <option value="2">���ʦ�ص�</option>
                  <option value="4">�Ͽͻ��ص�</option>
                  <option value="5">Ա���ص�</option>
                  <option value="6">�೤�ص�</option>
                  <option value="7">��¥��</option>
                  <option value="8">������</option>
                  <option value="9">����</option>
                </select>              </td>
              <td width="17%" align="right" bgcolor="#FFFFFF"> 
              �ͻ�����              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">�ɵ�״̬</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�����ɵ�</option>
                  <option value="2">�˹��ɵ�</option>
                  <option value="5">�����ɵ�</option>
                  <option value="6">��Ȩ�ɵ�</option>
                  <option value="7">�ܵ�</option>
                  <option value="8">��ʩ����</option>
                  <option value="4">�����޸��ɵ�</option>
                </select>              </td>
              <td width="17%" align="right" bgcolor="#FFFFFF">����ʩ����</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ɵ�ʱ�� ��</td>
              <td width="31%"> 
              <input type="text" name="pdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="pdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" bgcolor="#FFFFFF" align="right">�ɵ���</td>
              <td width="31%"> 
              <input type="text" name="pdr" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">�Ƿ�ܵ�</td>
              <td width="33%">
                <input type="radio" name="hfjl" value="0">δ�ܵ�
                <input type="radio" name="hfjl" value="3">�ܵ�              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">�ɵ�����</td>
              <td width="31%"> 
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">�˹��ɵ�</option>
                  <option value="1">�ص�����</option>
                  <option value="2">��˾����</option>
                  <option value="3">���ʦָ���ɵ�</option>
                  <option value="4">�ͻ�ָ���ɵ�</option>
                  <option value="7">�������</option>
                  <option value="8">�����ɵ�</option>
                  <option value="9">ͬС���ɵ�</option>
                </select>              </td>
              <td width="17%" align="right">�Ƿ�ռ�ɵ�ָ��</td>
              <td width="33%"><%
	cf.radioToken(out, "shzzb","Y+ռָ��&N+��ռָ��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ɵ����ȼ� ��</td>
              <td width="31%"> 
              <input type="text" name="sgdyxj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="sgdyxj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ɵ�˵��</td>
              <td colspan="3"> 
                <input type="text" name="pdsm" size="71" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#CCFFFF">
              <td align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ��
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                    <option value="pd_pdjl.xuhao desc">�ɵ����</option>
                    <option value="pd_pdjl.pdsj desc">�ɵ�ʱ��</option>
                    <option value="crm_khxx.kgsjqd desc">����ʱ���Ƿ�ȷ��</option>
                    <option value="crm_khxx.jyjdrq ">���齻������</option>
                    <option value="crm_khxx.khbh ">�ͻ����</option>
                    <option value="crm_khxx.khxm">�ͻ�����</option>
                    <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                    <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                    <option value="crm_khxx.sjs">���ʦ</option>
                    <option value="crm_khxx.sgd">ʩ����</option>
                    <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                    <option value="crm_khxx.hth">��ͬ��</option>
                    <option value="crm_khxx.gcjdbm">���̽���</option>
                    <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                    <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                    <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                    <option value="crm_khxx.dwbh">ǩԼ����</option>
                    <option value="crm_khxx.cxhdbm">�μӴ����</option>
                    <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                �ڶ���
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                    <option value="pd_pdjl.xuhao desc">�ɵ����</option>
                    <option value="pd_pdjl.pdsj desc" selected>�ɵ�ʱ��</option>
                  <option value="crm_khxx.kgsjqd desc">����ʱ���Ƿ�ȷ��</option>
                  <option value="crm_khxx.jyjdrq" >���齻������</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                ������
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                    <option value="pd_pdjl.xuhao desc">�ɵ����</option>
                    <option value="pd_pdjl.pdsj desc">�ɵ�ʱ��</option>
                  <option value="crm_khxx.kgsjqd desc">����ʱ���Ƿ�ȷ��</option>
                  <option value="crm_khxx.jyjdrq" >���齻������</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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
	cf.ajax(out);//����AJAX
%>
var cqbmMark=0;
var sjsbhMark=0;
var fieldName="";
function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	cqbmMark=0;
	sjsbhMark=0;
	FormName.sjsbh.length=1;
	FormName.cqbm.length=1;

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}
}
	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}
function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.zxdm.value=="")
			{
				sjsbhMark=0;
				selectform.zxdm.focus();
				alert("������ѡ����ѯ���桿");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.zxdm.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','��������') c2 from jc_cxhd where fgsbh='"+selectform.ssfgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
	else if (lx=="zxdjbm")
	{
		if (zxdjbmMark==0)
		{
			sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.ssfgs.value+"' order by cxbz,dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zxdjbmMark=1;
		}
		else{
			zxdjbmMark=2;
		}
	}
	else if (lx=="cqbm")
	{
		if (cqbmMark==0)
		{
			sql="select cqbm,cqmc from dm_cqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by cqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			cqbmMark=1;
		}
		else{
			cqbmMark=2;
		}
	}
	else if (lx=="rddqbm")
	{
		if (rddqbmMark==0)
		{
			sql="select rddqbm,rddq from dm_rddqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by rddqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			rddqbmMark=1;
		}
		else{
			rddqbmMark=2;
		}
	}
	else if (lx=="hxwzbm")
	{
		if (hxwzbmMark==0)
		{
			sql="select hxwzbm,hxwz from dm_hxwzbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by hxwzbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			hxwzbmMark=1;
		}
		else{
			hxwzbmMark=2;
		}
	}
}

function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="bjjb")
	{
		if (bjjbMark==0)
		{
			var sql="select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			bjjbMark=1;
		}
	}
	else if (lx=="xxlybm")
	{
		if (xxlybmMark==0)
		{
			var sql="select xxlybm,xxlymc from dm_xxlybm order by xxlybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			xxlybmMark=1;
		}
	}
	else if (lx=="fwlxbm")
	{
		if (fwlxbmMark==0)
		{
			var sql="select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fwlxbmMark=1;
		}
	}
	else if (lx=="zxysbm")
	{
		if (zxysbmMark==0)
		{
			var sql="select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zxysbmMark=1;
		}
	}
	else if (lx=="hxbm")
	{
		if (hxbmMark==0)
		{
			var sql="select hxbm,hxmc from dm_hxbm order by hxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			hxbmMark=1;
		}
	}
	else if (lx=="fgyqbm")
	{
		if (fgyqbmMark==0)
		{
			var sql="select fgflbm,fgflmc from dm_fgflbm order by fgflbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fgyqbmMark=1;
		}
	}
	else if (lx=="sbyybm")
	{
		if (sbyybmMark==0)
		{
			var sql="select sbyybm,sbyymc from dm_sbyybm order by sbyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sbyybmMark=1;
		}
	}
	else if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="ysrbm")
	{
		if (ysrbmMark==0)
		{
			sql="select ysrbm,ysrmc from dm_ysrbm order by ysrbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ysrbmMark=1;
		}
		else{
			ysrbmMark=2;
		}
	}
	else if (lx=="nlqjbm")
	{
		if (nlqjbmMark==0)
		{
			sql="select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			nlqjbmMark=1;
		}
		else{
			nlqjbmMark=2;
		}
	}
	else if (lx=="zybm")
	{
		if (zybmMark==0)
		{
			sql="select zybm,zymc from dm_zybm order by zybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zybmMark=1;
		}
		else{
			zybmMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="bjjb")
	{
		strToSelect(selectform.bjjb,ajaxRetStr);
	}
	else if (fieldName=="xxlybm")
	{
		strToSelect(selectform.xxlybm,ajaxRetStr);
	}
	else if (fieldName=="fwlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_fwlxbm,ajaxRetStr);
	}
	else if (fieldName=="zxysbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxysbm,ajaxRetStr);
	}
	else if (fieldName=="hxbm")
	{
		strToSelect(selectform.crm_zxkhxx_hxbm,ajaxRetStr);
	}
	else if (fieldName=="fgyqbm")
	{
		strToSelect(selectform.crm_zxkhxx_fgyqbm,ajaxRetStr);
	}
	else if (fieldName=="sbyybm")
	{
		strToSelect(selectform.crm_zxkhxx_sbyybm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="ysrbm")
	{
		strToSelect(selectform.ysrbm,ajaxRetStr);
	}
	else if (fieldName=="nlqjbm")
	{
		strToSelect(selectform.nlqjbm,ajaxRetStr);
	}
	else if (fieldName=="zybm")
	{
		strToSelect(selectform.zybm,ajaxRetStr);
	}
	else if (fieldName=="zxdjbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxdjbm,ajaxRetStr);
	}
	else if (fieldName=="cqbm")
	{
		strToSelect(selectform.cqbm,ajaxRetStr);
	}
	else if (fieldName=="rddqbm")
	{
		strToSelect(selectform.rddqbm,ajaxRetStr);
	}
	else if (fieldName=="hxwzbm")
	{
		strToSelect(selectform.hxwzbm,ajaxRetStr);
	}
}



function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq2, "���齻������"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq2, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isInt(FormName.sgdyxj, "�ɵ����ȼ�"))) {
		return false;
	}
	if(!(isInt(FormName.sgdyxj2, "�ɵ����ȼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
 

