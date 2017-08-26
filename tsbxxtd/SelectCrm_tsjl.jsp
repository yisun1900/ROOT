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
String slbm=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_tsjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">投诉记录号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">受理方式</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50">
              </td>
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000CC"><b>联系方式</b></font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">设计师</td>
              <td width="31%">
                <input type="text" name="crm_tsjl_sjs" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">质检员</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_zjy" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">施工队</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
				if (yhjs.equals("A0") || yhjs.equals("A1"))
				{
//					cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd order by sgdmc","");
				}
				else{
					cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
				}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否需回访</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsjl_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+需回访&N+不需回访","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">交工日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_jgrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">需回访时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_hfsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_hfsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客服受理时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">要求解决时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
					<option value=""></option>
					<option value="1">已受理</option>
					<option value="9">不立案</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">严重程度</div>
              </td>
              <td width="32%"> 
                <select name="yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">客服受理人</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">录入部门</td>
              <td width="32%"> 
                <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'","");
%> 
                </select>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.crm_tsjl_tsjlh, "投诉记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jgrq, "交工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj2, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj, "要求解决时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj2, "要求解决时间 "))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
