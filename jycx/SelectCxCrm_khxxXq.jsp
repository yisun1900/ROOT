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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select xqbm,xqmc,dqbm from dm_xqbm  order by xqbm,dqbm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

            <H4> <CENTER>���趨��ѯ����</CENTER></H4>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
			 <td width="19%" bgcolor="#E8E8FF" align="right">��ʼʱ��</td>
             <td width="19%" bgcolor="#E8E8FF" align="left"> <input type="text" name="sjfw" size="20" maxlength="10"  value=""></td>
			<td width="19%" bgcolor="#E8E8FF" align="right">��ֹʱ��</td>
             <td width="19%" bgcolor="#E8E8FF" align="left"> <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.today()%>"></td>
			</tr>
			<tr bgcolor="#E8E8FF"> 
              <td width="19%" bgcolor="#E8E8FF" align="right">��������</td>
			  
              <td width="31%"> 
                <select name="sscs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(sscs,csmc,<%=dwstr%>) ">
                   <option value=""></option>
				  <%		
		cf.selectItem(out,"select distinct dqbm,dqmc from dm_dqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">С��</td>
              <td width="33%"> 
                <select name="csmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ʾ���</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ  
                <input type="radio" name="xsfg" value="2">
                EXCEL </td> 
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
                <input type="button"  value="��ӡ" onClick="f_do(selectform,'dy')" name="button" >
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
     
      </div>
    </td>
  </tr>
</table>
   </form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName,pd)//����FormName:Form������
{
	
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}
	//if(	FormName.csmc.value=="") {
	//	alert("��ָ��С��");
	//	FormName.csmc.focus();
	//	return false;
	//}
	
	if (pd=='cx')
	{
		FormName.action="Crm_khxxCxListXq.jsp";
	}
	if (pd=='dy')
	{
		document.alert("sdf");
	}
	FormName.submit();
	return true;
	
}
</SCRIPT>
