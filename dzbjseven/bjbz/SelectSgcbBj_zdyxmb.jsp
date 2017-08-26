<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">维护施工成本</div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bj_zdyxmbSgcbList.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td align="right">地区</td>
              <td><select name="bj_zdyxmb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
%>
              </select></td>
              <td align="right">报价级别</td>
              <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                项目大类              </td>
              <td width="33%"> 
                <select name="bj_zdyxmb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_zdyxmb_xmdlbm,bj_zdyxmb_xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                项目小类              </td>
              <td width="32%"> 
                <select name="bj_zdyxmb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">项目分类</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">项目编号</td>
              <td width="33%"><input type="text" name="bj_zdyxmb_xmbh" size="20" maxlength="20" ></td>
              <td width="18%" align="right">项目名称</td>
              <td width="32%"><input type="text" name="bj_zdyxmb_xmmc" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                饰面              </td>
              <td width="33%"> 
                <select name="bj_zdyxmb_smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                计量单位              </td>
              <td width="32%"> 
                <select name="bj_zdyxmb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">录入人</td>
              <td width="33%"> 
				<input type="text" name="lrr" size="20" maxlength="20" value="" >              
			</td>
              <td width="18%" align="right">录入时间</td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">审核标志</td>
              <td colspan="3">
				  <input type="radio" name="shbz" value="N">申请审核
				  <input type="radio" name="shbz" value="S">受理申请
				  <input type="radio" name="shbz" value="Y">审核通过
				  <input type="radio" name="shbz" value="W">审核未通过
				  <input type="radio" name="shbz" value="C">重新申请			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <input type="text" name="gycl" size="73" maxlength="50" >              </td>
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
