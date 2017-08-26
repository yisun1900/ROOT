<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">通讯录查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_dwxxTxlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">单位编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">单位类型</div>
              </td>
              <td width="35%"> 
                <select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">总部</option>
                  <option value="A1">总部各部门</option>
                  <option value="F0">分公司</option>
                  <option value="F1">分公司各部门</option>
                  <option value="F2">店面</option>
                  <option value="S0">施工队</option>
                  <option value="S1">直属施工队</option>
                  <option value="S2">施工班组</option>
                  <option value="G0" selected>供应商</option>
                  <option value="J0">加盟商</option>
                  <option value="Y0">办公用品单位</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">供应商类别</td>
              <td width="31%"> 
                <select name="gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">木门</option>
                  <option value="2">橱柜</option>
                  <option value="3">家具</option>
                  <option value="4">主材</option>
                </select>
              </td>
              <td width="18%" align="right">主材类别</td>
              <td width="32%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm  order by zcdlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">单位简称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">单位名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">所属地区</td>
              <td width="35%"> 
                <select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">是否加盟商</td>
              <td width="35%"> 
                <select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">否</option>
                  <option value="Y">是</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属分公司</td>
              <td width="31%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%" align="right">上级单位</td>
              <td width="32%"> 
                <select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">合同号前缀</td>
              <td width="31%"> 
                <input type="text" name="hthqz" value="" size="20" maxlength="5" >
              </td>
              <td width="18%" align="right">撤店标志</td>
              <td width="32%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未撤销</option>
                  <option value="Y">已撤销</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">单位地址</td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >
              </td>
              <td width="15%" align="right">项目专员</td>
              <td width="35%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">单位负责人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">单位电话</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">单位传真</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">单位EMail</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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
