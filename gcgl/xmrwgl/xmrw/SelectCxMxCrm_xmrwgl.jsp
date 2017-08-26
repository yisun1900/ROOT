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
<form method="post" action="Crm_xmrwglCxMxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC">查询结果排序</td>
  <td colspan="3"> 第一列
    <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="crm_khxx.khxm">客户姓名</option>
        <option value="crm_khxx.fwdz">房屋地址</option>
        <option value="crm_khxx.hth">合同号</option>
        <option value="crm_xmrwgl.rwxh" >任务序号</option>
        <option value="crm_xmrwgl.rwbm">任务编码</option>
        <option value="crm_xmrwgl.rwmc">任务名称</option>
        <option value="crm_xmrwgl.rwflbm">任务分类</option>
        <option value="crm_xmrwgl.zdjkrw">重点监控任务</option>
        <option value="crm_xmrwgl.jhkssj">计划开始时间</option>
        <option value="crm_xmrwgl.jhjssj">计划结束时间</option>
        <option value="crm_xmrwgl.sjkssj">实际开始时间</option>
        <option value="crm_xmrwgl.sjjssj">实际结束时间</option>
        <option value="crm_xmrwgl.rwsyts">任务顺延天数</option>
      </select>
    第二列
    <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="crm_khxx.khxm">客户姓名</option>
        <option value="crm_khxx.fwdz">房屋地址</option>
        <option value="crm_khxx.hth">合同号</option>
        <option value="crm_xmrwgl.rwxh" selected>任务序号</option>
        <option value="crm_xmrwgl.rwbm">任务编码</option>
        <option value="crm_xmrwgl.rwmc">任务名称</option>
        <option value="crm_xmrwgl.rwflbm">任务分类</option>
        <option value="crm_xmrwgl.zdjkrw">重点监控任务</option>
        <option value="crm_xmrwgl.jhkssj">计划开始时间</option>
        <option value="crm_xmrwgl.jhjssj">计划结束时间</option>
        <option value="crm_xmrwgl.sjkssj">实际开始时间</option>
        <option value="crm_xmrwgl.sjjssj">实际结束时间</option>
        <option value="crm_xmrwgl.rwsyts">任务顺延天数</option>
    </select>
    第三列
    <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="crm_khxx.khxm">客户姓名</option>
        <option value="crm_khxx.fwdz">房屋地址</option>
        <option value="crm_khxx.hth">合同号</option>
        <option value="crm_xmrwgl.rwxh" >任务序号</option>
        <option value="crm_xmrwgl.rwbm">任务编码</option>
        <option value="crm_xmrwgl.rwmc">任务名称</option>
        <option value="crm_xmrwgl.rwflbm">任务分类</option>
        <option value="crm_xmrwgl.zdjkrw">重点监控任务</option>
        <option value="crm_xmrwgl.jhkssj">计划开始时间</option>
        <option value="crm_xmrwgl.jhjssj">计划结束时间</option>
        <option value="crm_xmrwgl.sjkssj">实际开始时间</option>
        <option value="crm_xmrwgl.sjjssj">实际结束时间</option>
        <option value="crm_xmrwgl.rwsyts">任务顺延天数</option>
    </select>
    <BR>
    <BR>
    第四列
    <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="crm_khxx.khxm">客户姓名</option>
        <option value="crm_khxx.fwdz">房屋地址</option>
        <option value="crm_khxx.hth">合同号</option>
        <option value="crm_xmrwgl.rwxh" >任务序号</option>
        <option value="crm_xmrwgl.rwbm">任务编码</option>
        <option value="crm_xmrwgl.rwmc">任务名称</option>
        <option value="crm_xmrwgl.rwflbm">任务分类</option>
        <option value="crm_xmrwgl.zdjkrw">重点监控任务</option>
        <option value="crm_xmrwgl.jhkssj">计划开始时间</option>
        <option value="crm_xmrwgl.jhjssj">计划结束时间</option>
        <option value="crm_xmrwgl.sjkssj">实际开始时间</option>
        <option value="crm_xmrwgl.sjjssj">实际结束时间</option>
        <option value="crm_xmrwgl.rwsyts">任务顺延天数</option>
    </select>
    第五列
    <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="crm_khxx.khxm">客户姓名</option>
        <option value="crm_khxx.fwdz">房屋地址</option>
        <option value="crm_khxx.hth">合同号</option>
        <option value="crm_xmrwgl.rwxh" >任务序号</option>
        <option value="crm_xmrwgl.rwbm">任务编码</option>
        <option value="crm_xmrwgl.rwmc">任务名称</option>
        <option value="crm_xmrwgl.rwflbm">任务分类</option>
        <option value="crm_xmrwgl.zdjkrw">重点监控任务</option>
        <option value="crm_xmrwgl.jhkssj">计划开始时间</option>
        <option value="crm_xmrwgl.jhjssj">计划结束时间</option>
        <option value="crm_xmrwgl.sjkssj">实际开始时间</option>
        <option value="crm_xmrwgl.sjjssj">实际结束时间</option>
        <option value="crm_xmrwgl.rwsyts">任务顺延天数</option>
    </select>
    第六列
    <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="crm_khxx.khxm">客户姓名</option>
        <option value="crm_khxx.fwdz">房屋地址</option>
        <option value="crm_khxx.hth">合同号</option>
        <option value="crm_xmrwgl.rwxh" >任务序号</option>
        <option value="crm_xmrwgl.rwbm">任务编码</option>
        <option value="crm_xmrwgl.rwmc">任务名称</option>
        <option value="crm_xmrwgl.rwflbm">任务分类</option>
        <option value="crm_xmrwgl.zdjkrw">重点监控任务</option>
        <option value="crm_xmrwgl.jhkssj">计划开始时间</option>
        <option value="crm_xmrwgl.jhjssj">计划结束时间</option>
        <option value="crm_xmrwgl.sjkssj">实际开始时间</option>
        <option value="crm_xmrwgl.sjjssj">实际结束时间</option>
        <option value="crm_xmrwgl.rwsyts">任务顺延天数</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" >显示风格</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量
    <input type="text" name="myxssl" size="7" maxlength="13" value="25">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
    <input type="reset"  value="重输">  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">统计表</td>
  <td colspan="3"> 第一列
    <input type="hidden" name="tj1name" value="">
      <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
        <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="hth">合同号</option>
        <option value="rwxh" >任务序号</option>
        <option value="rwbm">任务编码</option>
        <option value="rwmc">任务名称</option>
        <option value="rwflmc">任务分类</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','重点','2','非重点')">重点监控任务</option>
        <option value="jhkssj">计划开始时间</option>
        <option value="jhjssj">计划结束时间</option>
        <option value="sjkssj">实际开始时间</option>
        <option value="sjjssj">实际结束时间</option>
        <option value="rwsyts">任务顺延天数</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','是','N','否')">是否影响后续工期</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','是','N','否')">是否影响复尺</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','是','N','否')">是否需验收</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','是','N','否')">是否为里程碑</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','通过','N','未通过')">验收结论</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','有','N','无')">是否有工期变更单</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','完成','N','未完成')">整改是否完成</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','有','N','无')">是否有返补单</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','完成','N','否')">返补是否完成</option>
      </select>
    第二列
    <input type="hidden" name="tj2name" value="">
    <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="hth">合同号</option>
        <option value="rwxh" >任务序号</option>
        <option value="rwbm">任务编码</option>
        <option value="rwmc">任务名称</option>
        <option value="rwflmc">任务分类</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','重点','2','非重点')">重点监控任务</option>
        <option value="jhkssj">计划开始时间</option>
        <option value="jhjssj">计划结束时间</option>
        <option value="sjkssj">实际开始时间</option>
        <option value="sjjssj">实际结束时间</option>
        <option value="rwsyts">任务顺延天数</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','是','N','否')">是否影响后续工期</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','是','N','否')">是否影响复尺</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','是','N','否')">是否需验收</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','是','N','否')">是否为里程碑</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','通过','N','未通过')">验收结论</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','有','N','无')">是否有工期变更单</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','完成','N','未完成')">整改是否完成</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','有','N','无')">是否有返补单</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','完成','N','否')">返补是否完成</option>
    </select>
    第三列
    <input type="hidden" name="tj3name" value="">
    <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="hth">合同号</option>
        <option value="rwxh" >任务序号</option>
        <option value="rwbm">任务编码</option>
        <option value="rwmc">任务名称</option>
        <option value="rwflmc">任务分类</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','重点','2','非重点')">重点监控任务</option>
        <option value="jhkssj">计划开始时间</option>
        <option value="jhjssj">计划结束时间</option>
        <option value="sjkssj">实际开始时间</option>
        <option value="sjjssj">实际结束时间</option>
        <option value="rwsyts">任务顺延天数</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','是','N','否')">是否影响后续工期</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','是','N','否')">是否影响复尺</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','是','N','否')">是否需验收</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','是','N','否')">是否为里程碑</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','通过','N','未通过')">验收结论</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','有','N','无')">是否有工期变更单</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','完成','N','未完成')">整改是否完成</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','有','N','无')">是否有返补单</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','完成','N','否')">返补是否完成</option>
    </select>
    <BR>
    <BR>
    第四列
    <input type="hidden" name="tj4name" value="">
    <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="hth">合同号</option>
        <option value="rwxh" >任务序号</option>
        <option value="rwbm">任务编码</option>
        <option value="rwmc">任务名称</option>
        <option value="rwflmc">任务分类</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','重点','2','非重点')">重点监控任务</option>
        <option value="jhkssj">计划开始时间</option>
        <option value="jhjssj">计划结束时间</option>
        <option value="sjkssj">实际开始时间</option>
        <option value="sjjssj">实际结束时间</option>
        <option value="rwsyts">任务顺延天数</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','是','N','否')">是否影响后续工期</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','是','N','否')">是否影响复尺</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','是','N','否')">是否需验收</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','是','N','否')">是否为里程碑</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','通过','N','未通过')">验收结论</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','有','N','无')">是否有工期变更单</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','完成','N','未完成')">整改是否完成</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','有','N','无')">是否有返补单</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','完成','N','否')">返补是否完成</option>
    </select>
    第五列
    <input type="hidden" name="tj5name" value="">
    <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="hth">合同号</option>
        <option value="rwxh" >任务序号</option>
        <option value="rwbm">任务编码</option>
        <option value="rwmc">任务名称</option>
        <option value="rwflmc">任务分类</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','重点','2','非重点')">重点监控任务</option>
        <option value="jhkssj">计划开始时间</option>
        <option value="jhjssj">计划结束时间</option>
        <option value="sjkssj">实际开始时间</option>
        <option value="sjjssj">实际结束时间</option>
        <option value="rwsyts">任务顺延天数</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','是','N','否')">是否影响后续工期</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','是','N','否')">是否影响复尺</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','是','N','否')">是否需验收</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','是','N','否')">是否为里程碑</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','通过','N','未通过')">验收结论</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','有','N','无')">是否有工期变更单</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','完成','N','未完成')">整改是否完成</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','有','N','无')">是否有返补单</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','完成','N','否')">返补是否完成</option>
    </select>
    第六列
    <input type="hidden" name="tj6name" value="">
    <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="hth">合同号</option>
        <option value="rwxh" >任务序号</option>
        <option value="rwbm">任务编码</option>
        <option value="rwmc">任务名称</option>
        <option value="rwflmc">任务分类</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','重点','2','非重点')">重点监控任务</option>
        <option value="jhkssj">计划开始时间</option>
        <option value="jhjssj">计划结束时间</option>
        <option value="sjkssj">实际开始时间</option>
        <option value="sjjssj">实际结束时间</option>
        <option value="rwsyts">任务顺延天数</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','是','N','否')">是否影响后续工期</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','是','N','否')">是否影响复尺</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','是','N','否')">是否需验收</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','是','N','否')">是否为里程碑</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','通过','N','未通过')">验收结论</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','有','N','无')">是否有工期变更单</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','完成','N','未完成')">整改是否完成</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','有','N','无')">是否有返补单</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','完成','N','否')">返补是否完成</option>
    </select>  </td>
</tr>
<tr align="center">
  <td colspan="4"><input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">客户编号</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">客户姓名</td> 
  <td width="31%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门</td>
  <td><input type="text" name="crm_xmrwgl_lrbm" size="20" maxlength="5" >  </td>
  <td align="right">房屋地址</td>
  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">合同号</td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right">设计师</td>
  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">任务编码</td> 
  <td width="31%"> 
    <select name="crm_xmrwgl_rwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwbm,rwmc from dm_bzrwbm order by rwbm","");
%>
    </select>  </td>
  <td align="right" width="19%">任务名称</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_rwmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">任务分类</td> 
  <td width="31%"> 
    <select name="crm_xmrwgl_rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">重点监控任务</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_zdjkrw","1+重点监控&2+非重点监控","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需提醒</td>
  <td><%
	cf.radioToken(out, "sfxtx","Y+需提醒&N+否","");
%></td>
  <td align="right">报警级别</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from dm_bjjbbm order by bjjbbm","");
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">提醒日期</td>
  <td><input type="text" name="txrq" size="20" maxlength="8"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="txrq2" size="20" maxlength="8"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">提醒小时</td>
  <td><input type="text" name="txxs" size="20" maxlength="8"  value="" ></td>
  <td align="right">到</td>
  <td><input type="text" name="txxs2" size="20" maxlength="8"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">报警类别</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "crm_xmrwgl_bjlb","1+事前报警&2+事后提醒&3+事前事后都提醒&9+一般记录","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事前提醒天数 从</td>
  <td><input type="text" name="crm_xmrwgl_sqtxts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_sqtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">事后提醒天数 从</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_shtxts" size="20" maxlength="8" ></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_shtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否影响后续工期</td>
  <td><%
	cf.radioToken(out, "crm_xmrwgl_sfyxhxgq","Y+是&N+否","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">是否影响复尺</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfyxfc","Y+是&N+否","");
%>  </td>
  <td align="right" width="19%">是否需验收</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfxys","Y+是&N+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">是否为里程碑</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfwlcb","Y+是&N+否","");
%>  </td>
  <td align="right" width="19%">摘要任务</td> 
  <td width="31%"> 
    <select name="crm_xmrwgl_zyrwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">任务序号</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_rwxh" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">责任人</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_zrr" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">节点得分</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_jddf" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划开始时间 从</td>
  <td><input type="text" name="crm_xmrwgl_jhkssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_jhkssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划结束时间 从</td>
  <td><input type="text" name="crm_xmrwgl_jhjssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_jhjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">计划工作日 从</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_jhgzr" size="20" maxlength="8" ></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_jhgzr2" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">节点顺延天数 从</td>
  <td><input type="text" name="crm_xmrwgl_jdsyts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_jdsyts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">实际开始时间 从</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjkssj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjkssj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实际结束时间 从</td>
  <td><input type="text" name="crm_xmrwgl_sjjssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_sjjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">实际工作日 从</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjgzr" size="20" maxlength="8" ></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjgzr2" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收人</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_ysr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收时间 从</td>
  <td><input type="text" name="crm_xmrwgl_yssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_yssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收结论</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_ysjl","Y+通过&N+未通过","");
%>  </td>
  <td align="right" width="19%">是否延期</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfyq","Y+是&N+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">延期天数 从</td>
  <td><input type="text" name="crm_xmrwgl_yqts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_yqts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">延期责任方</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_yqzrf" size="20" maxlength="20" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">是否有工期变更单</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfybgd","Y+有&N+无","");
%>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">预计整改完成时间 从</td>
  <td><input type="text" name="crm_xmrwgl_yjzgwcsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_yjzgwcsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">整改是否完成</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_zgsfwc","Y+完成&N+未完成","");
%>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">整改完成时间 从</td>
  <td><input type="text" name="crm_xmrwgl_zgwcsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_zgwcsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">是否有返补单</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfyfbd","Y+有&N+无","");
%>  </td>
  <td align="right" width="19%">返补是否完成</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_fbsfwc","Y+完成&N+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_xmrwgl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmrwgl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">录入人</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.crm_xmrwgl_sqtxts, "事前提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_sqtxts2, "事前提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_shtxts, "事后提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_shtxts2, "事后提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_rwxh, "任务序号"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jddf, "节点得分"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhkssj, "计划开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhkssj2, "计划开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhjssj, "计划结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhjssj2, "计划结束时间"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jhgzr, "计划工作日"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jhgzr2, "计划工作日"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jdsyts, "节点顺延天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jdsyts2, "节点顺延天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjkssj, "实际开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjkssj2, "实际开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjjssj, "实际结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjjssj2, "实际结束时间"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_sjgzr, "实际工作日"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_sjgzr2, "实际工作日"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yssj, "验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yssj2, "验收时间"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_yqts, "延期天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_yqts2, "延期天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yjzgwcsj, "预计整改完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yjzgwcsj2, "预计整改完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_zgwcsj, "整改完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_zgwcsj2, "整改完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_lrsj2, "录入时间"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Crm_xmrwglCxMxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Crm_xmrwglTjList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
