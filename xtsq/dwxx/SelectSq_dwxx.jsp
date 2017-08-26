<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">单位信息－维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_dwxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                单位编号              </td>
              <td width="32%"> 
              <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >              </td>
              <td width="18%" align="right"> 
                单位类型              </td>
              <td width="32%"> 
                <select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">总部</option>
                  <option value="A1">总部各部门</option>
                  <option value="F0">分公司</option>
                  <option value="F1">分公司各部门</option>
                  <option value="F2">店面</option>
                  <option value="F3">设计小组</option>
                  <option value="F4">市场小组</option>
                  <option value="F5">其它小组</option>
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                单位简称              </td>
              <td width="32%"> 
              <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
                单位名称              </td>
              <td width="32%"> 
              <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">单位分类</td>
              <td width="32%"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
              </select>              </td>
              <td width="18%" align="right">所属大区</td>
              <td width="32%"> 
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属地区</td>
              <td width="32%"> 
                <select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
              </select>              </td>
              <td width="18%" align="right">公司类型</td>
              <td width="32%"> 
                <select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">直营公司</option>
                  <option value="Y">加盟公司</option>
                  <option value="Q">其它公司</option>
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属分公司</td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%> 
              </select>              </td>
              <td width="18%" align="right">上级单位</td>
              <td width="32%"> 
                <select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('A0','F0','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">合同号前缀</td>
              <td width="32%"> 
              <input type="text" name="hthqz" value="" size="20" maxlength="5" >              </td>
              <td width="18%" align="right">撤店标志</td>
              <td width="32%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未撤销</option>
                  <option value="Y">已撤销</option>
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属方位</td>
              <td width="32%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
              </select>              </td>
              <td width="18%" align="right">单位级别</td>
              <td width="32%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">单位地址</td>
              <td width="32%"> 
              <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >              </td>
              <td width="18%" align="right">项目专员</td>
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
                单位负责人              </td>
              <td width="32%"> 
              <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                单位电话              </td>
              <td width="32%"> 
              <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                单位传真              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
              <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">店面形式</td>
              <td width="32%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
              </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">查询结果排序</td>
              <td colspan="3"> 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="sq_dwxx.dwbh">单位编号</option>
                  <option value="sq_dwxx.dwmc">单位名称</option>
                  <option value="sq_dwxx.ssfgs">所属分公司</option>
                  <option value="sq_dwxx.dwlx">单位类型</option>
                </select>              </td>
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
