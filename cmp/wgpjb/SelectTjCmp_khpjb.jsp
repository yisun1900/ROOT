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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">ͳ��-�깤���۱�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right"> 
        �ֹ�˾      </td>
              <td width="32%"> 
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
				</select>			  
			  </td>
      <td width="18%" align="right"> 
        ǩԼ����      </td>
      <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">��ͬ��</td>
      <td width="32%"> 
        <input type="text" name="hth" size="20" maxlength="20">      </td>
      <td width="18%" align="right">�ͻ����</td>
      <td width="32%"> 
        <input type="text" name="khbh" size="20" maxlength="20">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        �ͻ�����      </td>
      <td width="32%"> 
        <input type="text" name="khxm" size="20" maxlength="50">      </td>
      <td width="18%" align="right"> 
        ��ϵ��ʽ      </td>
      <td width="32%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ݵ�ַ</td>
      <td width="32%"> 
        <input type="text" name="fwdz" size="20" maxlength="100">      </td>
      <td align="right" width="18%">ʩ����</td>
      <td width="32%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ʦ</td>
      <td width="32%"> 
        <input type="text" name="sjs" size="20" maxlength="20" >      </td>
      <td align="right" width="18%">�ʼ�</td>
      <td width="32%"> 
        <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��Ŀ����</td>
      <td width="32%"><select name="xmfl" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select xmfl c1,xmfl c2 from cmp_xmflbm order by xmflbm","");
%>
      </select></td>
      <td align="right" width="18%">���۽��</td>
      <td width="32%"><input type="radio" name="pjjgbm" value="1">
����
  <input type="radio" name="pjjgbm" value="2">
һ��
<input type="radio" name="pjjgbm" value="3">
������</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������Ŀ</td>
      <td colspan="3"> 
        <select name="pjxm" style="FONT-SIZE:12PX;WIDTH:522PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select pjxm c1,pjxm||'��'||xmfl||'��' c2 from cmp_pjxmbm order by xmflbm,pjxmbm","");
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">��ʾ���</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">ѡ��ͨ��ͳ����</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">�ʼ�</option>
          <option value="sgdmc">ʩ����</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">�ʼ�</option>
          <option value="sgdmc">ʩ����</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">�ʼ�</option>
          <option value="sgdmc">ʩ����</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        <BR>
        ������ 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">�ʼ�</option>
          <option value="sgdmc">ʩ����</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        ������ 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">�ʼ�</option>
          <option value="sgdmc">ʩ����</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>
        ������ 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">���ʦ</option>
          <option value="zjxm">�ʼ�</option>
          <option value="sgdmc">ʩ����</option>
          <option value="xmfl">��Ŀ����</option>
          <option value="pjxm">������Ŀ</option>
          <option value="pjjg">���۽��</option>
        </select>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="ͨ��ͳ��" onClick="f_do(selectform,'tytj')">
        <input type="button" onClick="f_do(selectform,'myd')"  value="�����ͳ��" name="myd">
        <input type="button"  value="�ͻ����ۻ��ܱ�" onClick="f_do(selectform,'khpjhzb')" name="pjhz">
        <input type="button"  value="����������ܱ�" onClick="f_do(selectform,'dcwthzb')" name="wthz">
        <input type="button"  value="���������ͳ��" onClick="f_do(selectform,'demyd')" name="demyd">
        <input type="reset"  value="����">      </td>
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


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.lrsj, "¼��ʱ�� "))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ�� "))) {
		return false;
	}

	if (lx=='tytj')
	{
		FormName.action="Cmp_khpjxmTjList.jsp";
	}
	else if (lx=='myd')
	{
	/*
		if(	javaTrim(FormName.lrsj)=="") {
			alert("��ѡ��[¼��ʱ��]��");
			FormName.lrsj.focus();
			return false;
		}
		if(	javaTrim(FormName.lrsj2)=="") {
			alert("��ѡ��[¼��ʱ��]��");
			FormName.lrsj2.focus();
			return false;
		}
*/
		FormName.action="mydtjb.jsp";
		FormName.myd.disabled=true;
	}
	else if (lx=='khpjhzb')
	{
		FormName.action="khpjhzb.jsp";
		FormName.pjhz.disabled=true;
	}
	else if (lx=='dcwthzb')
	{
		FormName.action="dcwthzb.jsp";
		FormName.wthz.disabled=true;
	}
	else if (lx=='demyd')
	{
		FormName.action="demydtj.jsp";
		FormName.demyd.disabled=true;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
