<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String lx=cf.GB2Uni(request.getParameter("lx"));
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
	String jgwzbm=cf.getParameter(request,"jgwzbm");

%>
<body bgcolor="#FFFFFF">
<form method="post" action="Bj_cltczcmxCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%>
      </select>    </td>
    <td align="right">房间位置</td>
    <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm where jgwzmc='"+jgwzbm+"'","");
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">套餐名称</td>
    <td colspan="3"><input type="text" name="tcmc" size="73" maxlength="50" value="<%=tcmc%>" readonly></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品编码</td> 
  <td width="32%"> 
    <input type="text" name="cpbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"> 
    <input type="text" name="cpmc" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"> 
    <input type="text" name="xh" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"> 
    <input type="text" name="gg" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
  <td align="right" width="18%">供应商名称</td> 
  <td width="32%"> 
    <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type="hidden" name="lx" value="<%=lx%>">
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
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
