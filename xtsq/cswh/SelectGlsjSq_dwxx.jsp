<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<form method="post" action="Sq_dwxxGlsjList.jsp" name="selectform">
<div align="center">��Ϣ����ʱ�䣭ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		��λ���              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >              </td>
	  <td width="18%" align="right"> 
		��λ����              </td>
	  <td width="32%"> 
		<select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value="A0">�ܲ�</option>
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		��λ���              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >              </td>
	  <td width="18%" align="right"> 
		��λ����              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">��λ����</td>
	  <td width="32%"> 
		<select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
	  </select>              </td>
	  <td width="18%" align="right">��������</td>
	  <td width="32%"> 
		<select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">��������</td>
	  <td width="32%"> 
		<select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
	  </select>              </td>
	  <td width="18%" align="right">��˾����</td>
	  <td width="32%"> 
		<select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <option value="N">ֱӪ��˾</option>
		  <option value="Y">���˹�˾</option>
		  <option value="Q">������˾</option>
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">�����ֹ�˾</td>
	  <td width="32%"> 
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
	  <td width="18%" align="right">�ϼ���λ</td>
	  <td width="32%"> 
		<select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('A0','F0','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">��ͬ��ǰ׺</td>
	  <td width="32%"> 
	  <input type="text" name="hthqz" value="" size="20" maxlength="5" >              </td>
	  <td width="18%" align="right">�����־</td>
	  <td width="32%"> 
		<select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value="N">δ����</option>
		  <option value="Y">�ѳ���</option>
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">������λ</td>
	  <td width="32%"> 
		<select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
	  </select>              </td>
	  <td width="18%" align="right">��λ����</td>
	  <td width="32%"> 
		<select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">��λ��ַ</td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >              </td>
	  <td width="18%" align="right">��ĿרԱ</td>
	  <td width="32%"> 
		<select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
	  </select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		��λ������              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >              </td>
	  <td width="18%" align="right"> 
		��λ�绰              </td>
	  <td width="32%"> 
	  <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		��λ����              </td>
	  <td width="32%" bgcolor="#FFFFFF"> 
	  <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >              </td>
	  <td width="18%" align="right">������ʽ</td>
	  <td width="32%"> 
		<select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
	  </select>              </td>
	</tr>
	
	<tr align="center"> 
	  <td colspan="4"> 
		<input type="button"  value="��ѯ" onClick="f_do(selectform)">
		<input type="reset"  value="����">              </td>
	</tr>
</table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>