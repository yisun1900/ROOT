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


	String zwbm=(String)session.getAttribute("zwbm");
	String sjs=(String)session.getAttribute("yhmc");
	if (!zwbm.equals("04"))
	{
		sjs="";
	}
	String xmzy=(String)session.getAttribute("yhmc");
	if (!zwbm.equals("10"))
	{
		xmzy="";
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">����طÿͻ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC">
              <td align="right"> �ֹ�˾ </td>
              <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
                </select>              </td>
              <td align="right"> ǩԼ���� </td>
              <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
              <td align="right">��ͬ��</td>
              <td><input type="text" name="hth" size="20" maxlength="20">              </td>
              <td align="right">�ͻ����</td>
              <td><input type="text" name="khbh" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ʦ</td>
              <td><input type="text" name="sjs" size="20" value="<%=sjs%>" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
              <td align="right">���̵���</td>
              <td><input type="text" name="zjxm" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
              <td><input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td align="right">�ͻ�����</td>
              <td><input type="text" name="khxm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font> </td>
              <td><input type="text" name="lxfs" size="20" maxlength="50"></td>
              <td align="right"> ��ϵ��ʽ </td>
              <td><input type="text" name="lxfs2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
              <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ���ݵ�ַ </td>
              <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�´λط�����</td>
              <td width="33%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>              </td>

              <td align="right">���̽���</td>
              <td><select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm , gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">����ط�ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="hfrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
              <td width="14%" align="right">��
              <td> <input type="text" name="hfrq2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">   </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">ʵ�ʿ������� ��</td>
              <td><input type="text" name="sjkgrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
              <td align="right">��</td>
              <td><input type="text" name="sjkgrq2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">ʵ�ʿ�������  ��</td>
              <td><input type="text" name="sjjgrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
              <td align="right">��</td>
              <td><input type="text" name="sjjgrq2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">ʩ����</td>
              <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
                  <option value=""></option>
                </select>  </td>
              <td align="right">��ĿרԱ</td>
              <td><input type="text" name="xmzy" size="20" maxlength="20" value="<%=xmzy%>" <% if (!xmzy.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><strong>�ϴ�����طó���</strong></td>
              <td width="33%"><input name="sjhfts" type="text" id="sjhfts" onDblClick="JSCalendar(this)" value="5" size="10" maxlength="10">
              ��</td>
              <td width="14%" align="right">&nbsp;</td>
              <td width="36%">&nbsp;</td>
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

var sgdMark=0;
var fieldName="";

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";
	sgdMark=0;
	FormName.sgd.length=1;

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

function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}
	
	if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'��'||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��')||'��' from sq_sgd where ssfgs='"+selectform.fgs.value+"' order by sgdlx desc,cxbz,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.sgd,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.hfrq, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq2, "�ط�ʱ��"))) {
		return false;
	}
	
	if(!(isDatetime(FormName.sjkgrq, "ʵ�ʿ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjkgrq2, "ʵ�ʿ���ʱ��"))) {
		return false;
	}
	
	if(!(isDatetime(FormName.sjjgrq, "ʵ�ʿ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjjgrq2, "ʵ�ʿ���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
