<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">质保金修改记录</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_sgdCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right">所属分公司</td>
              <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
				<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
				%> 
                </select>              </td>
              <td align="right">撤销标志</td>
              <td><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未撤销</option>
                  <option value="Y">已撤销</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <div align="right">施工队编号              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_sgd" size="20" maxlength="5" >              </td>
              <td width="19%" align="right"> 
                <div align="right">施工队类型              </td>
              <td width="31%"> 
                <select name="sq_sgd_sgdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="S0">施工队</option>
                  <option value="S1">直属施工队</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <div align="right">施工队名称              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="100" >              </td>
              <td width="19%" align="right"> 
                <div align="right">施工队电话              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_dh" size="20" maxlength="30" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">队号</td>
              <td width="31%"> 
                <input type="text" name="duihao" value="" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">级别</td>
              <td width="31%"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%> 
                </select>              </td>
            </tr>
            
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">结果排序</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="sq_sgd.sgdjbbm">施工队级别</option>
                  <option value="sq_sgd.duihao">队号</option>
                  <option value="sq_sgd.sgdmc">施工队名称</option>
                  <option value="sq_sgd.sgd">施工队编号</option>
                </select>              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
