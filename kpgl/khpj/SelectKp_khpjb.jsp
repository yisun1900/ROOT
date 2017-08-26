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
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="Kp_khpjbList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kp_khpjb_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="74" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">签约日期 从</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">质检</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">施工队</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_gcjd","1+满意&2+基本满意&3+不满意","");
%> </td>
              <td width="18%"> 
                <div align="right">工人文明施工程度</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_wmsgcd","1+满意&2+基本满意&3+不满意","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">施工队整体服务</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_ctfw","1+满意&2+基本满意&3+不满意","");
%> </td>
              <td width="18%"> 
                <div align="right">公司配送材料</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_pscl","1+满意&2+基本满意&3+不满意","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">施工队代买材料</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_dmcl","1+满意&2+基本满意&3+不满意","");
%> </td>
              <td width="18%"> 
                <div align="right">设计效果</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_sjxg","1+满意&2+基本满意&3+不满意","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">设计服务</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_sjfw","1+满意&2+基本满意&3+不满意","");
%> </td>
              <td width="18%"> 
                <div align="right">监理服务</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_jlfw","1+满意&2+基本满意&3+不满意","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kp_khpjb_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">施工质量</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "kp_khpjb_sgzl","1+满意&2+基本满意&3+不满意","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">录入时间 从</td>
              <td width="33%"> 
                <input type="text" name="kp_khpjb_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="kp_khpjb_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)" name="button">
                <input type="reset"  value="重输" name="reset">
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
	if(!(isDatetime(FormName.kp_khpjb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_khpjb_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
