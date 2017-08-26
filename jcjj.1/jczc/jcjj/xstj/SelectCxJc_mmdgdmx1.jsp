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
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">所属公司</td>
      <td width="30%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
      <td width="19%" align="right">签约店面</td>
      <td width="31%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1") || yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">客户编号</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">客户姓名</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">房屋地址</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">联系方式</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">合同号</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">设计师</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">工程签约额 从</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">家装签约日期 从</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">施工队</td>
      <td width="30%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
%> 
        </select>
      </td>
      <td align="right" width="19%">质检</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">预订单编号</td>
      <td width="30%"> 
        <input type="text" name="jc_mmdgdmx_yddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="19%">项目专员</td>
      <td width="31%"> 
        <select name="jc_mmydd_xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2  from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">驻店家居顾问</td>
      <td width="30%"> 
        <select name="jc_mmydd_clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="19%">展厅家居顾问</td>
      <td width="31%"> 
        <select name="jc_mmydd_ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门订购类型</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">门类型</td>
      <td width="31%"> 
        <select name="jc_mmdgdmx_mlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门型号</td>
      <td width="30%"> 
        <input type="text" name="jc_mmdgdmx_mmxh" size="20" maxlength="12" >
      </td>
      <td align="right" width="19%">类型</td>
      <td width="31%"><%
	cf.radioToken(out, "jc_mmdgdmx_lx","1+合同项&2+增项","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门油色</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">木门材质</td>
      <td width="31%"> 
        <select name="jc_mmdgdmx_czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">安装位置</td>
      <td width="30%"> 
        <input type="text" name="jc_mmdgdmx_azwzbm" size="20" maxlength="2" >
      </td>
      <td align="right" width="19%">开启方向</td>
      <td width="31%"> 
        <select name="jc_mmdgdmx_kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">地材种类</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dczlbm,dczlmc from jdm_dczlbm order by dczlbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">窗套边数</td>
      <td width="31%"> <%
	cf.radioToken(out, "jc_mmdgdmx_ctbs","3+三边&4+四边","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">单双口</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_mmdgdmx_dsk","1+单口&2+双口","");
%> </td>
      <td align="right" width="19%">是否艺术玻璃门</td>
      <td width="31%"> <%
	cf.radioToken(out, "jc_mmdgdmx_sfysblm","1+是&2+否","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">玻璃型号</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">门套哑口是否松木集成材</td>
      <td width="31%"> <%
	cf.radioToken(out, "jc_mmdgdmx_sfsmjcc","Y+是&N+否","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">是否有顶窗</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_mmdgdmx_sfydc","Y+有顶窗&N+无顶窗","");
%> </td>
      <td align="right" width="19%">是否自动计价</td>
      <td width="31%"><%
	cf.radioToken(out, "jc_mmdgdmx_sfzdjj","1+自动&2+人工","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门合同日期 从</td>
      <td width="30%"> 
        <input type="text" name="jc_mmydd_htrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="jc_mmydd_htrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门工厂</td>
      <td width="30%"> 
        <select name="jc_mmydd_pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='1' and ssfgs='"+ssfgs+"' order by gysmc","");
%> 
        </select>
      </td>
      <td align="right" width="19%">木门测量技师</td>
      <td width="31%"> 
        <select name="jc_mmydd_mmcljs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc,yhmc from sq_yhxx where zwbm='18' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N')","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门退单时间 从</td>
      <td width="30%"> 
        <input type="text" name="jc_mmydd_tdsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="jc_mmydd_tdsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">木门签定人</td>
      <td width="30%"> 
        <input type="text" name="jc_mmydd_htqdr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp; </td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right" bgcolor="#FFFFCC">查询结果排序</td>
      <td colspan="3"> 第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="jc_mmydd.pdgc">派单工厂</option>
          <option value="jc_mmdgdmx.mmdglxbm">订购类型</option>
          <option value="jc_mmdgdmx.mlx">门类型</option>
          <option value="jc_mmdgdmx.mmxh">木门型号</option>
          <option value="jc_mmdgdmx.ysbm">油色</option>
          <option value="jc_mmdgdmx.czbm">材质</option>
          <option value="jc_mmdgdmx.azwzbm">安装位置</option>
          <option value="jc_mmdgdmx.dsk">单双口</option>
          <option value="jc_mmdgdmx.sfysblm">是否艺术玻璃门</option>
          <option value="jc_mmdgdmx.blxhbm">玻璃型号</option>
          <option value="jc_mmdgdmx.sfsmjcc">是否松木集成材</option>
          <option value="jc_mmdgdmx.sfydc">是否有顶窗</option>
          <option value="jc_mmdgdmx.lx">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh" selected>订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="jc_mmydd.mmcljs">木门测量技师</option>
          <option value="jc_mmydd.xmzy">项目专员</option>
          <option value="jc_mmydd.clgw">驻店家居顾问</option>
          <option value="jc_mmydd.ztjjgw">展厅家居顾问</option>
        </select>
        第二列 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">派单工厂</option>
          <option value="jc_mmdgdmx.mmdglxbm">订购类型</option>
          <option value="jc_mmdgdmx.mlx">门类型</option>
          <option value="jc_mmdgdmx.mmxh">木门型号</option>
          <option value="jc_mmdgdmx.ysbm">油色</option>
          <option value="jc_mmdgdmx.czbm">材质</option>
          <option value="jc_mmdgdmx.azwzbm">安装位置</option>
          <option value="jc_mmdgdmx.dsk">单双口</option>
          <option value="jc_mmdgdmx.sfysblm">是否艺术玻璃门</option>
          <option value="jc_mmdgdmx.blxhbm">玻璃型号</option>
          <option value="jc_mmdgdmx.sfsmjcc">是否松木集成材</option>
          <option value="jc_mmdgdmx.sfydc">是否有顶窗</option>
          <option value="jc_mmdgdmx.lx">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="jc_mmydd.mmcljs">木门测量技师</option>
          <option value="jc_mmydd.xmzy">项目专员</option>
          <option value="jc_mmydd.clgw">驻店家居顾问</option>
          <option value="jc_mmydd.ztjjgw">展厅家居顾问</option>
        </select>
        第三列 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">派单工厂</option>
          <option value="jc_mmdgdmx.mmdglxbm">订购类型</option>
          <option value="jc_mmdgdmx.mlx">门类型</option>
          <option value="jc_mmdgdmx.mmxh">木门型号</option>
          <option value="jc_mmdgdmx.ysbm">油色</option>
          <option value="jc_mmdgdmx.czbm">材质</option>
          <option value="jc_mmdgdmx.azwzbm">安装位置</option>
          <option value="jc_mmdgdmx.dsk">单双口</option>
          <option value="jc_mmdgdmx.sfysblm">是否艺术玻璃门</option>
          <option value="jc_mmdgdmx.blxhbm">玻璃型号</option>
          <option value="jc_mmdgdmx.sfsmjcc">是否松木集成材</option>
          <option value="jc_mmdgdmx.sfydc">是否有顶窗</option>
          <option value="jc_mmdgdmx.lx">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="jc_mmydd.mmcljs">木门测量技师</option>
          <option value="jc_mmydd.xmzy">项目专员</option>
          <option value="jc_mmydd.clgw">驻店家居顾问</option>
          <option value="jc_mmydd.ztjjgw">展厅家居顾问</option>
        </select>
        <br><br>
        第四列 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">派单工厂</option>
          <option value="jc_mmdgdmx.mmdglxbm">订购类型</option>
          <option value="jc_mmdgdmx.mlx">门类型</option>
          <option value="jc_mmdgdmx.mmxh">木门型号</option>
          <option value="jc_mmdgdmx.ysbm">油色</option>
          <option value="jc_mmdgdmx.czbm">材质</option>
          <option value="jc_mmdgdmx.azwzbm">安装位置</option>
          <option value="jc_mmdgdmx.dsk">单双口</option>
          <option value="jc_mmdgdmx.sfysblm">是否艺术玻璃门</option>
          <option value="jc_mmdgdmx.blxhbm">玻璃型号</option>
          <option value="jc_mmdgdmx.sfsmjcc">是否松木集成材</option>
          <option value="jc_mmdgdmx.sfydc">是否有顶窗</option>
          <option value="jc_mmdgdmx.lx">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="jc_mmydd.mmcljs">木门测量技师</option>
          <option value="jc_mmydd.xmzy">项目专员</option>
          <option value="jc_mmydd.clgw">驻店家居顾问</option>
          <option value="jc_mmydd.ztjjgw">展厅家居顾问</option>
        </select>
        第五列 
        <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">派单工厂</option>
          <option value="jc_mmdgdmx.mmdglxbm">订购类型</option>
          <option value="jc_mmdgdmx.mlx">门类型</option>
          <option value="jc_mmdgdmx.mmxh">木门型号</option>
          <option value="jc_mmdgdmx.ysbm">油色</option>
          <option value="jc_mmdgdmx.czbm">材质</option>
          <option value="jc_mmdgdmx.azwzbm">安装位置</option>
          <option value="jc_mmdgdmx.dsk">单双口</option>
          <option value="jc_mmdgdmx.sfysblm">是否艺术玻璃门</option>
          <option value="jc_mmdgdmx.blxhbm">玻璃型号</option>
          <option value="jc_mmdgdmx.sfsmjcc">是否松木集成材</option>
          <option value="jc_mmdgdmx.sfydc">是否有顶窗</option>
          <option value="jc_mmdgdmx.lx">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="jc_mmydd.mmcljs">木门测量技师</option>
          <option value="jc_mmydd.xmzy">项目专员</option>
          <option value="jc_mmydd.clgw">驻店家居顾问</option>
          <option value="jc_mmydd.ztjjgw">展厅家居顾问</option>
        </select>
        第六列 
        <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">派单工厂</option>
          <option value="jc_mmdgdmx.mmdglxbm">订购类型</option>
          <option value="jc_mmdgdmx.mlx">门类型</option>
          <option value="jc_mmdgdmx.mmxh">木门型号</option>
          <option value="jc_mmdgdmx.ysbm">油色</option>
          <option value="jc_mmdgdmx.czbm">材质</option>
          <option value="jc_mmdgdmx.azwzbm">安装位置</option>
          <option value="jc_mmdgdmx.dsk">单双口</option>
          <option value="jc_mmdgdmx.sfysblm">是否艺术玻璃门</option>
          <option value="jc_mmdgdmx.blxhbm">玻璃型号</option>
          <option value="jc_mmdgdmx.sfsmjcc">是否松木集成材</option>
          <option value="jc_mmdgdmx.sfydc">是否有顶窗</option>
          <option value="jc_mmdgdmx.lx">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="jc_mmydd.mmcljs">木门测量技师</option>
          <option value="jc_mmydd.xmzy">项目专员</option>
          <option value="jc_mmydd.clgw">驻店家居顾问</option>
          <option value="jc_mmydd.ztjjgw">展厅家居顾问</option>

		</select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="20%" >显示风格</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量 
        <input type="text" name="myxssl" size="7" maxlength="13" value="30">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="重输">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">统计表</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">派单工厂</option>
          <option value="mmdglxmc">订购类型</option>
          <option value="mlxmc">门类型</option>
          <option value="mmxh">木门型号</option>
          <option value="mmczmc">油色</option>
          <option value="czmc">材质</option>
          <option value="azwzmc">安装位置</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口')">单双口</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否')">是否艺术玻璃门</option>
          <option value="blxh">玻璃型号</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否')">是否松木集成材</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗')">是否有顶窗</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项')">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="mmcljs">木门测量技师</option>
          <option value="xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">派单工厂</option>
          <option value="mmdglxmc">订购类型</option>
          <option value="mlxmc">门类型</option>
          <option value="mmxh">木门型号</option>
          <option value="mmczmc">油色</option>
          <option value="czmc">材质</option>
          <option value="azwzmc">安装位置</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口')">单双口</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否')">是否艺术玻璃门</option>
          <option value="blxh">玻璃型号</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否')">是否松木集成材</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗')">是否有顶窗</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项')">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="mmcljs">木门测量技师</option>
          <option value="xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">派单工厂</option>
          <option value="mmdglxmc">订购类型</option>
          <option value="mlxmc">门类型</option>
          <option value="mmxh">木门型号</option>
          <option value="mmczmc">油色</option>
          <option value="czmc">材质</option>
          <option value="azwzmc">安装位置</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口')">单双口</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否')">是否艺术玻璃门</option>
          <option value="blxh">玻璃型号</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否')">是否松木集成材</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗')">是否有顶窗</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项')">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="mmcljs">木门测量技师</option>
          <option value="xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
        </select>
        <br>
        <br>
        第四列 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">派单工厂</option>
          <option value="mmdglxmc">订购类型</option>
          <option value="mlxmc">门类型</option>
          <option value="mmxh">木门型号</option>
          <option value="mmczmc">油色</option>
          <option value="czmc">材质</option>
          <option value="azwzmc">安装位置</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口')">单双口</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否')">是否艺术玻璃门</option>
          <option value="blxh">玻璃型号</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否')">是否松木集成材</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗')">是否有顶窗</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项')">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="mmcljs">木门测量技师</option>
          <option value="xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
        </select>
        第五列 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">派单工厂</option>
          <option value="mmdglxmc">订购类型</option>
          <option value="mlxmc">门类型</option>
          <option value="mmxh">木门型号</option>
          <option value="mmczmc">油色</option>
          <option value="czmc">材质</option>
          <option value="azwzmc">安装位置</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口')">单双口</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否')">是否艺术玻璃门</option>
          <option value="blxh">玻璃型号</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否')">是否松木集成材</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗')">是否有顶窗</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项')">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="mmcljs">木门测量技师</option>
          <option value="xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
        </select>
        第六列 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">派单工厂</option>
          <option value="mmdglxmc">订购类型</option>
          <option value="mlxmc">门类型</option>
          <option value="mmxh">木门型号</option>
          <option value="mmczmc">油色</option>
          <option value="czmc">材质</option>
          <option value="azwzmc">安装位置</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口')">单双口</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否')">是否艺术玻璃门</option>
          <option value="blxh">玻璃型号</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否')">是否松木集成材</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗')">是否有顶窗</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项')">类型</option>
 
          <option value="crm_khxx.khbh">客户编号</option>
          <option value="crm_khxx.khxm">客户姓名</option>
          <option value="crm_khxx.fwdz">房屋地址</option>
          <option value="jc_mmydd.yddbh">订单编号</option>
          <option value="jc_mmydd.htrq">木门签合同日期</option>
          <option value="mmcljs">木门测量技师</option>
          <option value="xmzy">项目专员</option>
          <option value="clgw">驻店家居顾问</option>
          <option value="ztjjgw">展厅家居顾问</option>
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.crm_khxx_qye, "工程签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "工程签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "家装签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "家装签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq, "木门合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq2, "木门合同日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_tdsj, "木门退单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_tdsj2, "木门退单时间"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_mmdgdmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_mmdgdmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
