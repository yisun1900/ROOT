<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String) session.getAttribute("yhjs");
String dwbh=(String) session.getAttribute("dwbh");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <p>
                  <input type="button"  value="首次消费会员查询" onClick="f_do(selectform,'sccx')">
                  <input type="button"  value="多次消费会员查询" onClick="f_do(selectform,'dccx')" name="button">
                  <input type="button"  value="全部会员查询" onClick="f_do(selectform,'qbcx')" name="button2">
                </p>
                <p> 
                  <input type="button"  value="首次消费会员统计" onClick="f_do(selectform,'sctj')" name="button3">
                  <input type="button"  value="多次消费会员统计" onClick="f_do(selectform,'dctj')" name="button32">
                  <input type="button"  value="全部会员统计" onClick="f_do(selectform,'qbtj')" name="button33">
                </p>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right" bgcolor="#CCFFFF">统计</td>
              <td colspan="3"> 第一列 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">职业</option>
                  <option value="hy_ysrdmb.ysrdm">月收入</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25岁以下','2','25-35岁','3','35-45岁','4','45-55岁','5','55岁以上','6','未填写')">年龄段</option>
                  <option value="hy_gmyydmb.gmyy">购买原因</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','首饰种类齐全','01','首饰品质好','02','款式时尚高贵','03','价格合理','04','服务好','05','购物环境好','06','未填写','07','其他',dm_gmyj.gmyjbm)">相关考虑因素</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','男','W','女')">性别</option>
                  <option value="hy_hyjbb.hyjb">会员级别</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','已婚','N','未婚')">婚姻状况</option>

				  <option value="sq_dwxx.dwmc">所属专卖店</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','是','N','否')">是否作废</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>


				  <option value="HY_XXQD.xmmc">获取信息的渠道</option>
				  <option value="HY_VIP.xmmc">VIP福利</option>
				  <option value="HY_SHFW.xmmc">售后服务建议</option>
				  <option value="HY_CXHD.xmmc">是否愿意参加活动</option>
                  <option value="hy_gjjy.xmmc">改进建议</option>

                </select>
                第二列 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">职业</option>
                  <option value="hy_ysrdmb.ysrdm">月收入</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25岁以下','2','25-35岁','3','35-45岁','4','45-55岁','5','55岁以上','6','未填写')">年龄段</option>
                  <option value="hy_gmyydmb.gmyy">购买原因</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','首饰种类齐全','01','首饰品质好','02','款式时尚高贵','03','价格合理','04','服务好','05','购物环境好','06','未填写','07','其他',dm_gmyj.gmyjbm)">相关考虑因素</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','男','W','女')">性别</option>
                  <option value="hy_hyjbb.hyjb">会员级别</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','已婚','N','未婚')">婚姻状况</option>

				  <option value="sq_dwxx.dwmc">所属专卖店</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','是','N','否')">是否作废</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>


				  <option value="HY_XXQD.xmmc">获取信息的渠道</option>
				  <option value="HY_VIP.xmmc">VIP福利</option>
				  <option value="HY_SHFW.xmmc">售后服务建议</option>
				  <option value="HY_CXHD.xmmc">是否愿意参加活动</option>
                  <option value="hy_gjjy.xmmc">改进建议</option>

                </select>
                第三列 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">职业</option>
                  <option value="hy_ysrdmb.ysrdm">月收入</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25岁以下','2','25-35岁','3','35-45岁','4','45-55岁','5','55岁以上','6','未填写')">年龄段</option>
                  <option value="hy_gmyydmb.gmyy">购买原因</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','首饰种类齐全','01','首饰品质好','02','款式时尚高贵','03','价格合理','04','服务好','05','购物环境好','06','未填写','07','其他',dm_gmyj.gmyjbm)">相关考虑因素</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','男','W','女')">性别</option>
                  <option value="hy_hyjbb.hyjb">会员级别</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','已婚','N','未婚')">婚姻状况</option>

				  <option value="sq_dwxx.dwmc">所属专卖店</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','是','N','否')">是否作废</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>


				  <option value="HY_XXQD.xmmc">获取信息的渠道</option>
				  <option value="HY_VIP.xmmc">VIP福利</option>
				  <option value="HY_SHFW.xmmc">售后服务建议</option>
				  <option value="HY_CXHD.xmmc">是否愿意参加活动</option>
                  <option value="hy_gjjy.xmmc">改进建议</option>

                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right" bgcolor="#CCFFFF">查询结果排序</td>
              <td colspan="3"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="hy_hyxxb.hykh">水质分析卡号</option>
                  <option value="hy_hyxxb.hybh">会员编号</option>
                  <option value="hy_hyxxb.hyxm">会员姓名</option>
                  <option value="hy_hyxxb.rhrq">入会日期</option>

                  <option value="hy_hyjbb.hyjb">会员级别</option>
				  <option value="xb">性别</option>
				  <option value="hy_hyxxb.Csrq">出生日期</option>
				  <option value="hyzk">婚姻状况</option>
				  <option value="hy_hyxxb.Hydz">会员地址</option>

				  <option value="hy_hyxxb.Yzbm">邮政编码</option>
				  <option value="hy_hyxxb.Dzxx">电子信箱</option>
				  <option value="hy_hyxxb.Dh">电话</option>
				  <option value="hy_hyxxb.Sj">手机</option>
				  <option value="hy_hyxxb.zydm">职业</option>
				  <option value="hy_hyxxb.ysrdm">月收入</option>
				  <option value="hy_hyxxb.dwbh">所属专卖店</option>
				  <option value="sfzf">是否作废</option>
				  <option value="hy_hyxxb.fwlx">服务类型</option>
				  <option value="hy_hyxxb.gmcs">购买次数</option>
				  <option value="hy_hyxxb.xfzje">消费总金额</option>
				  <option value="hy_hyxxb.jf">积分</option>
				  <option value="hy_hyxxb.wdhjf">未兑换积分</option>
                </select>
                每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">入会日期 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_rhrq" size="20" maxlength="10" value="" onKeyUp="keyGo(hy_hyxxb_rhrq2)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_rhrq2" size="20" maxlength="10" value="" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">购买日期 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxfjlb_gmrq" size="20" maxlength="10"  value=""onKeyUp="keyGo(hy_hyxfjlb_gmrq2)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxfjlb_gmrq2" size="20" maxlength="10" value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">会员级别</td>
              <td width="33%"> 
                <select name="hy_hyxxb_hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">所属专卖店</td>
              <td width="33%"> 
                <select name="hy_hyxxb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("00"))//00：总公司
	{
		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx not in('5','6') order by dwbh","");
	}
	else if (yhjs.equals("02"))//02：分公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("01"))//01：专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03：加盟商
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//04：加盟专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right">职业</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_zydm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%	
				  cf.selectItem(out," select xh,zymc from hy_zydmb order by xh","");
				  %> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">月收入</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">购买原因</td>
              <td width="33%"> 
                <select name="hy_hyxfjlb_gmyy" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,gmyy from hy_gmyydmb order by xh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">相关考虑因素</td>
              <td width="33%"> 
                <select name="hy_hyxfjlb_gmyjbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gmyjbm,gmyjmc from hy_gmyjbm order by gmyjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">家庭收入</div>
              </td>
              <td width="33%"> 
                <select name="jtsr" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='家庭收入'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">年龄范围</div>
              </td>
              <td width="33%"> 
                <select name="nlfw" style="FONT-SIZE:12PX;WIDTH:152PX" multiple size="4">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='年龄段'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%"> 
                <div align="right">下次可能买的钻石饰品</div>
              </td>
              <td width="33%"> 
                <select name="xcgm" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm order by pmbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">现拥有的钻石饰品</div>
              </td>
              <td width="33%"> 
                <select name="xysp" style="FONT-SIZE:12PX;WIDTH:152PX" multiple size="4">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm order by pmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">为谁购买首饰</div>
              </td>
              <td width="33%"> 
                <select name="gmmd" style="FONT-SIZE:12PX;WIDTH:152PX" multiple size="4">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='为谁购买'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">获取信息的渠道</div>
              </td>
              <td width="33%"> 
                <select name="xxqd" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='信息渠道'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%"> 
                <div align="right">VIP福利</div>
              </td>
              <td width="33%"> 
                <select name="vipfl" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='VIP'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">售后服务建议</div>
              </td>
              <td width="33%"> 
                <select name="shfwjy" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='售后服务'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">是否愿意参加活动</div>
              </td>
              <td width="33%"> 
                <select name="cjhd" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='促销活动'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">改进建议</div>
              </td>
              <td width="33%"> 
                <select name="gjjy" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='改进建议'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">出生日期 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_csrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
            <td width="20%"> <div align="right">出生日期 从</div></td>
            <td width="31%"> <select  name="yf" >
			   <option value="00"></option>
                <option value="01">1月</option>
                <option value="02">2月</option>
                <option value="03">3月</option>
                <option value="04">4月</option>
                <option value="05">5月</option>
                <option value="06">6月</option>
                <option value="07">7月</option>
                <option value="08">8月</option>
                <option value="09">9月</option>
                <option value="10">10月</option>
                <option value="11">11月</option>
                <option value="12">12月</option>
              </select> <select name="rq" style="FONT-SIZE:14px;WIDTH:60px" >
			  	<option value="00"></option>
                <option value="01">1日</option>
                <option value="02">2日</option>
                <option value="03">3日</option>
                <option value="04">4日</option>
                <option value="05">5日</option>
                <option value="06">6日</option>
                <option value="07">7日</option>
                <option value="08">8日</option>
                <option value="09">9日</option>
                <option value="10">10日</option>
                <option value="11">11日</option>
                <option value="12">12日</option>
                <option value="13">13日</option>
                <option value="14">14日</option>
                <option value="15">15日</option>
                <option value="16">16日</option>
                <option value="17">17日</option>
                <option value="18">18日</option>
                <option value="19">19日</option>
                <option value="20">20日</option>
                <option value="21">21日</option>
                <option value="22">22日</option>
                <option value="23">23日</option>
                <option value="24">24日</option>
                <option value="25">25日</option>
                <option value="26">26日</option>
                <option value="27">27日</option>
                <option value="28">28日</option>
                <option value="29">29日</option>
                <option value="30">30日</option>
                <option value="31">31日</option>
              </select> </td>
            <td width="20%"> <div align="right">到</div></td>
            <td width="29%"> <select  name="yf2" >
				<option value="00"></option>
                <option value="01">1月</option>
                <option value="02">2月</option>
                <option value="03">3月</option>
                <option value="04">4月</option>
                <option value="05">5月</option>
                <option value="06">6月</option>
                <option value="07">7月</option>
                <option value="08">8月</option>
                <option value="09">9月</option>
                <option value="10">10月</option>
                <option value="11">11月</option>
                <option value="12">12月</option>
              </select> <select name="rq2" style="FONT-SIZE:14px;WIDTH:60px" >
			  <option value="00"></option>
                <option value="01">1日</option>
                <option value="02">2日</option>
                <option value="03">3日</option>
                <option value="04">4日</option>
                <option value="05">5日</option>
                <option value="06">6日</option>
                <option value="07">7日</option>
                <option value="08">8日</option>
                <option value="09">9日</option>
                <option value="10">10日</option>
                <option value="11">11日</option>
                <option value="12">12日</option>
                <option value="13">13日</option>
                <option value="14">14日</option>
                <option value="15">15日</option>
                <option value="16">16日</option>
                <option value="17">17日</option>
                <option value="18">18日</option>
                <option value="19">19日</option>
                <option value="20">20日</option>
                <option value="21">21日</option>
                <option value="22">22日</option>
                <option value="23">23日</option>
                <option value="24">24日</option>
                <option value="25">25日</option>
                <option value="26">26日</option>
                <option value="27">27日</option>
                <option value="28">28日</option>
                <option value="29">29日</option>
                <option value="30">30日</option>
                <option value="31">31日</option>
              </select> </td>
          </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">结婚纪念日 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jhjnr" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jhjnr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">爱人生日 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_arsr" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_arsr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">购买次数 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_gmcs" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_gmcs2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">消费总金额 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_xfzje" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_xfzje2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%"> 
                <div align="right">积分 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jf" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">未兑换积分 从</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_wdhjf" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_wdhjf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">会员编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hybh" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">是否作废</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_sfzf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+作废&N+未作废","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <div align="right">水质分析卡号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hykh" size="20" maxlength="11" >
              </td>
              <td width="17%" align="right"> 
                <div align="right">服务类型</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+基本服务&2+增值服务","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">会员密码</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hymm" size="20" maxlength="12" >
              </td>
              <td width="17%"> 
                <div align="right">会员姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hyxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">性别</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "hy_hyxxb_xb","M+男&W+女","");
%> </td>
              <td width="17%"> 
                <div align="right">邮政编码</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_yzbm" size="20" maxlength="12" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">会员地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="hy_hyxxb_hydz" size="57" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">电话</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_dh" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">手机</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_sj" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">电子信箱</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_dzxx" size="20" maxlength="40" >
              </td>
              <td width="17%"> 
                <div align="right">身份证号码</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" height="28"> 
                <div align="right">婚姻状况</div>
              </td>
              <td width="33%" height="28"> <%
	cf.radioToken(out, "hy_hyxxb_hyzk","Y+已婚&N+未婚","");
%> </td>
              <td width="17%" height="28"> 
                <div align="right">爱人姓名</div>
              </td>
              <td width="33%" height="28"> 
                <input type="text" name="hy_hyxxb_arxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">价格印象</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">服务印象</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">风格印象</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">工艺印象</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">专店风格</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">平时爱好</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">喜爱报纸杂志</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_bzzz" size="20" value="">
              </td>
              <td width="17%"> 
                <div align="right">所知同类品牌</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_sztlpp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">喜欢去的商店</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_shop" size="20" value="">
              </td>
              <td width="17%"> 
                <div align="right">喜欢化妆品品牌</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hzppp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">喜欢服装品牌</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_fzpp" size="20" value="">
              </td>
              <td width="17%"> 
                <div align="right">信息录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_xxlrr" size="20" maxlength="16" >
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.hy_hyxxb_rhrq, "入会日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "入会日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "购买日期 "))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "购买日期 "))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_csrq2, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr, "结婚纪念日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr2, "结婚纪念日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr, "爱人生日"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr2, "爱人生日"))) {
		return false;
	}
//	if(!(isDatetime(FormName.hy_hyxxb_yxrq, "有效日期"))) {
//		return false;
//	}
//	if(!(isDatetime(FormName.hy_hyxxb_yxrq2, "有效日期"))) {
//		return false;
//	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs, "购买次数"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs2, "购买次数"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje, "消费总金额"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje2, "消费总金额"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf, "积分"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf2, "积分"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf, "未兑换积分"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf2, "未兑换积分"))) {
		return false;
	}

	

	if (lx=="sccx")
	{
		if(	javaTrim(FormName.hy_hyxxb_rhrq)=="") {
			alert("请输入[入会日期]！");
			FormName.hy_hyxxb_rhrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq, "入会日期"))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxxb_rhrq2)=="") {
			alert("请输入[入会日期]！");
			FormName.hy_hyxxb_rhrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "入会日期"))) {
			return false;
		}
		FormName.action="Hy_hyxxbScCxList.jsp";
	}
	else if (lx=="dccx")
	{
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq)=="") {
			alert("请输入[购买日期]！");
			FormName.hy_hyxfjlb_gmrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "购买日期 "))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq2)=="") {
			alert("请输入[购买日期]！");
			FormName.hy_hyxfjlb_gmrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "购买日期 "))) {
			return false;
		}
		FormName.action="Hy_hyxxbDcCxList.jsp";
	}
	else if (lx=="qbcx")
	{
		if(!(isInt(FormName.myxssl, "每页显示数量"))) {
				return false;
		}
		FormName.action="Hy_hyxxbCxList.jsp";
	}
	else if (lx=="sctj")
	{
		if(	javaTrim(FormName.hy_hyxxb_rhrq)=="") {
			alert("请输入[入会日期]！");
			FormName.hy_hyxxb_rhrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq, "入会日期"))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxxb_rhrq2)=="") {
			alert("请输入[入会日期]！");
			FormName.hy_hyxxb_rhrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "入会日期"))) {
			return false;
		}
		FormName.action="sctj.jsp";
	}
	else if (lx=="dctj")
	{
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq)=="") {
			alert("请输入[购买日期]！");
			FormName.hy_hyxfjlb_gmrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "购买日期 "))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq2)=="") {
			alert("请输入[购买日期]！");
			FormName.hy_hyxfjlb_gmrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "购买日期 "))) {
			return false;
		}
		FormName.action="dctj.jsp";
	}
	else if (lx=="qbtj")
	{
		FormName.action="qbtj.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
