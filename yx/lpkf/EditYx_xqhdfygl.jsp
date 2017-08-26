<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khzq=null;
String yjzczfj=null;
String dqsjcz=null;
String dqkfhs=null;
String pjde=null;
String dqhd=null;
String xqzyl=null;
String jzds1=null;
String jzds1zyl=null;
String jzds2=null;
String jzds2zyl=null;
String jzds3=null;
String jzds3zyl=null;
String kfjd=null;
String sjfylx=null;
String dqsjfy=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherexqmc=cf.getParameter(request,"xqmc");
String wherekhzq=cf.getParameter(request,"khzq");


String xqmc=null;
String yjfy=null;
String yjcc=null;
String sjfy=null;
String sjcc=null;
String spjl=null;
String spr=null;
String spsj=null;
String spyj=null;
String fgsbh=null;
String spzt=null;
String scbfzr=null;
String scbfzrdh=null;
String scbzrs=null;
String scbsffz=null;
String gjjzgwrs=null;
String ryydl=null;
String kfql=null;
String fasfwc=null;
String kfxs=null;

String dqbm=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
String zlhxmj=null;
String lxsj=null;
String fyssj=null;
String jfhs=null;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String fysysm=null;

String dwdz=null;
String dwdh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fysysm,khzq,yjzczfj,dqsjcz,dqkfhs,pjde,dqhd,xqzyl,jzds1,jzds1zyl,jzds2,jzds2zyl,jzds3,jzds3zyl,kfjd,sjfylx,dqsjfy,lrr,lrsj,bz ";
	ls_sql+=" from  yx_xqhdfygl";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (xqmc='"+wherexqmc+"') and  (khzq='"+wherekhzq+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fysysm=cf.fillNull(rs.getString("fysysm"));
		khzq=cf.fillNull(rs.getString("khzq"));
		yjzczfj=cf.fillNull(rs.getString("yjzczfj"));
		dqsjcz=cf.fillNull(rs.getString("dqsjcz"));
		dqkfhs=cf.fillNull(rs.getString("dqkfhs"));
		pjde=cf.fillNull(rs.getString("pjde"));
		dqhd=cf.fillNull(rs.getString("dqhd"));
		xqzyl=cf.fillNull(rs.getString("xqzyl"));
		jzds1=cf.fillNull(rs.getString("jzds1"));
		jzds1zyl=cf.fillNull(rs.getString("jzds1zyl"));
		jzds2=cf.fillNull(rs.getString("jzds2"));
		jzds2zyl=cf.fillNull(rs.getString("jzds2zyl"));
		jzds3=cf.fillNull(rs.getString("jzds3"));
		jzds3zyl=cf.fillNull(rs.getString("jzds3zyl"));
		kfjd=cf.fillNull(rs.getString("kfjd"));
		sjfylx=cf.fillNull(rs.getString("sjfylx"));
		dqsjfy=cf.fillNull(rs.getString("dqsjfy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select xqmc,yjfy,yjcc,sjfy,sjcc,spjl,spr,spsj,spyj,lrr,lrsj,fgsbh,bz,spzt,scbfzr,scbfzrdh,scbzrs,scbsffz,gjjzgwrs,ryydl,kfql,fasfwc,kfxs ";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xqmc=cf.fillNull(rs.getString("xqmc"));
		yjfy=cf.fillNull(rs.getString("yjfy"));
		yjcc=cf.fillNull(rs.getString("yjcc"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		sjcc=cf.fillNull(rs.getString("sjcc"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		spzt=cf.fillNull(rs.getString("spzt"));
		scbfzr=cf.fillNull(rs.getString("scbfzr"));
		scbfzrdh=cf.fillNull(rs.getString("scbfzrdh"));
		scbzrs=cf.fillNull(rs.getString("scbzrs"));
		scbsffz=cf.fillNull(rs.getString("scbsffz"));
		gjjzgwrs=cf.fillNull(rs.getString("gjjzgwrs"));
		ryydl=cf.fillNull(rs.getString("ryydl"));
		kfql=cf.fillNull(rs.getString("kfql"));
		fasfwc=cf.fillNull(rs.getString("fasfwc"));
		kfxs=cf.fillNull(rs.getString("kfxs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dwdz,dwdh,dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (xqmc='"+wherexqmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		jw=cf.fillNull(rs.getString("jw"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

  <div align="center">修改小区活动费用</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="8" align="center"><b>基本情况</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">公司</td>
      <td width="14%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="12%">地址</td>
      <td colspan="3"><%=dwdz%></td>
      <td width="11%" align="right">电话</td>
      <td width="14%"><%=dwdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">市场部负责人</td>
      <td width="14%"><%=scbfzr%></td>
      <td align="right" width="12%">电话</td>
      <td colspan="3"><%=scbfzrdh%></td>
      <td width="11%" align="right">&nbsp;</td>
      <td width="14%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">市场部总人数</td>
      <td width="14%"><%=scbzrs%> </td>
      <td align="right" width="12%">市场部是否分组</td>
      <td width="13%"><%
	cf.radioToken(out, "N+未分组&Y+分组",scbsffz,true);
%></td>
      <td width="12%" align="right">高级家装顾问人数</td>
      <td width="13%"><%=gjjzgwrs%></td>
      <td width="11%" align="right">人员异动率</td>
      <td width="14%"><%=ryydl%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">小区名称</td>
      <td colspan="2"><%=xqmc%> </td>
      <td align="right" width="13%">地址</td>
      <td colspan="2"><%=dz%></td>
      <td width="11%" align="right">立项时间</td>
      <td width="14%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">开发商</td>
      <td width="14%"><%=kfs%></td>
      <td align="right" width="12%">开发商联系人</td>
      <td width="13%"><%=kfslxr%></td>
      <td width="12%" align="right">开发商联系人职务</td>
      <td width="13%"><%=kfslxrzw%></td>
      <td width="11%" align="right">电话</td>
      <td width="14%"><%=kfslxrdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">物业公司名称</td>
      <td width="14%"><%=wygsmc%> </td>
      <td align="right" width="12%">物业联系人</td>
      <td width="13%"><%=wylxr%></td>
      <td width="12%" align="right">物业联系人职务</td>
      <td width="13%"><%=wylxrzw%></td>
      <td width="11%" align="right">物业电话</td>
      <td width="14%"><%=wydh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">交钥匙时间</td>
      <td width="14%"><%=fyssj%> </td>
      <td align="right" width="12%">交房户数</td>
      <td width="13%"><%=jfhs%></td>
      <td width="12%" align="right">主力户型</td>
      <td width="13%"><%=zlhx%></td>
      <td width="11%" align="right">主力户型面积</td>
      <td width="14%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">物业形式</td>
      <td width="14%"><%=wyxs%> </td>
      <td align="right" width="12%">价位</td>
      <td width="13%"><%=jw%></td>
      <td width="12%" align="right">小区负责人</td>
      <td width="13%"><%=xqfzr%></td>
      <td width="11%" align="right">小区负责人电话</td>
      <td width="14%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">楼盘性质</td>
      <td width="14%"><%=xz%> </td>
      <td align="right" width="12%">开发潜力</td>
      <td width="13%"><%=kfql%></td>
      <td width="12%" align="right">开发形式</td>
      <td width="13%"><%=kfxs%></td>
      <td width="11%">&nbsp;</td>
      <td width="14%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="11%">预计费用</td>
      <td width="14%"><%=yjfy%> </td>
      <td align="right" width="12%">预计产出</td>
      <td width="13%"><%=yjcc%></td>
      
    <td width="12%" align="right">实际费用</td>
      
    <td width="13%"><%=sjfy%></td>
    <td width="11%" align="right">实际产出</td>
      
    <td width="14%"><%=sjcc%> </td>
    </tr>
  </table>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">考核周期</td>
	<td  width="4%">预计总产值分解</td>
	<td  width="4%">当期实际产值</td>
	<td  width="4%">当期开发户数</td>
	<td  width="4%">平均单额</td>
	<td  width="9%">当期活动</td>
	<td  width="4%">小区占有率</td>
	<td  width="7%">竞争对手1</td>
	<td  width="4%">竞争对手1占有率</td>
	<td  width="7%">竞争对手2</td>
	<td  width="4%">竞争对手2占有率</td>
	<td  width="7%">竞争对手3</td>
	<td  width="4%">竞争对手3占有率</td>
	<td  width="5%">开发进度</td>
	<td  width="6%">实际费用类型</td>
	<td  width="4%">当期实际费用</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="10%">备注</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	ls_sql="SELECT khzq,yjzczfj,dqsjcz,dqkfhs,pjde,dqhd,xqzyl,jzds1,jzds1zyl,jzds2,jzds2zyl,jzds3,jzds3zyl,kfjd,sjfylx,dqsjfy,lrr,lrsj,bz  ";
	ls_sql+=" FROM yx_xqhdfygl  ";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ls_sql+=" order by khzq  ";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

<form method="post" action="SaveEditYx_xqhdfygl.jsp" name="editform">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">开发方案是否完成</td>
      <td width="33%"><%
	cf.radioToken(out, "fasfwc","N+未完成&Y+完成",fasfwc);
%></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">考核周期</td>
      <td width="33%"> 
        <input type="text" name="khzq" size="20" maxlength="50"  value="<%=khzq%>" >      </td>
      <td align="right" width="18%">预计总产值分解</td>
      <td width="32%"> 
        <input type="text" name="yjzczfj" size="20" maxlength="16"  value="<%=yjzczfj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">当期实际产值</td>
      <td width="33%"> 
        <input type="text" name="dqsjcz" size="20" maxlength="16"  value="<%=dqsjcz%>" >      </td>
      <td align="right" width="18%">当期开发户数</td>
      <td width="32%"> 
        <input type="text" name="dqkfhs" size="20" maxlength="8"  value="<%=dqkfhs%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">平均单额</td>
      <td width="33%"> 
        <input type="text" name="pjde" size="20" maxlength="16"  value="<%=pjde%>" >      </td>
      <td align="right" width="18%">当期活动</td>
      <td width="32%"> 
        <input type="text" name="dqhd" size="20" maxlength="50"  value="<%=dqhd%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">小区占有率</td>
      <td width="33%"> 
        <input type="text" name="xqzyl" size="20" maxlength="9"  value="<%=xqzyl%>" >      </td>
      <td align="right" width="18%">开发进度</td>
      <td width="32%"> 
        <input type="text" name="kfjd" size="20" maxlength="50"  value="<%=kfjd%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">竞争对手1</td>
      <td width="33%"> 
        <input type="text" name="jzds1" size="20" maxlength="50"  value="<%=jzds1%>" >      </td>
      <td align="right" width="18%">竞争对手1占有率</td>
      <td width="32%"> 
        <input type="text" name="jzds1zyl" size="20" maxlength="9"  value="<%=jzds1zyl%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">竞争对手2</td>
      <td width="33%"> 
        <input type="text" name="jzds2" size="20" maxlength="50"  value="<%=jzds2%>" >      </td>
      <td align="right" width="18%">竞争对手2占有率</td>
      <td width="32%"> 
        <input type="text" name="jzds2zyl" size="20" maxlength="9"  value="<%=jzds2zyl%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">竞争对手3</td>
      <td width="33%"> 
        <input type="text" name="jzds3" size="20" maxlength="50"  value="<%=jzds3%>" >      </td>
      <td align="right" width="18%">竞争对手3占有率</td>
      <td width="32%"> 
        <input type="text" name="jzds3zyl" size="20" maxlength="9"  value="<%=jzds3zyl%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">实际费用类型</td>
      <td width="33%"> 
        <input type="text" name="sjfylx" size="20" maxlength="20"  value="<%=sjfylx%>" >      </td>
      <td align="right" width="18%">当期实际费用</td>
      <td width="32%"> 
        <input type="text" name="dqsjfy" size="20" maxlength="16"  value="<%=dqsjfy%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">费用使用说明</td>
      <td colspan="3"><textarea name="fysysm" cols="71" rows="3" ><%=fysysm%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>      </td>
      <td align="right" width="18%">录入时间</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
    <input type="hidden" name="wherexqmc"  value="<%=wherexqmc%>" >
    <input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>      </td>
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(!(isNumber(FormName.yjzczfj, "预计总产值分解"))) {
		return false;
	}
	if(!(isNumber(FormName.dqsjcz, "当期实际产值"))) {
		return false;
	}
	if(!(isNumber(FormName.dqkfhs, "当期开发户数"))) {
		return false;
	}
	if(!(isNumber(FormName.pjde, "平均单额"))) {
		return false;
	}
	if(!(isFloat(FormName.xqzyl, "小区占有率"))) {
		return false;
	}
	if(!(isFloat(FormName.jzds1zyl, "竞争对手1占有率"))) {
		return false;
	}
	if(!(isFloat(FormName.jzds2zyl, "竞争对手2占有率"))) {
		return false;
	}
	if(!(isFloat(FormName.jzds3zyl, "竞争对手3占有率"))) {
		return false;
	}
	if(!(isNumber(FormName.dqsjfy, "当期实际费用"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
