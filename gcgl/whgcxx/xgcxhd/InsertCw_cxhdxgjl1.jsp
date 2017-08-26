<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String fgsmc= null;
String dwbh= null;
String dwmc= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
double wdzgce= 0;
double qye= 0;
double cdzwjmje= 0;
double suijin= 0;
double suijinbfb= 0;
double glfbfb=0;//管理费百分比
double zqguanlif= 0;
double guanlif= 0;
double glfjmje= 0;
double sjjmje= 0;

double zqwjrqyexm= 0;
double zhwjrqyexm= 0;
String wjrqyexmsm= null;

double sjf= 0;
double glf= 0;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zklx="";


try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc dwmc,sjsbh,sjs,sjsgh,wdzgce";
	ls_sql+=" ,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif ";
	ls_sql+=" ,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		fgsmc=cf.fillNull(rs.getString("fgsmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  cw_cxhdxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>


<div align="center">修改促销活动（修改记录号：<%=xgjlh%>）<font color="#FF0000"><strong>
<P>
注意：不影响签约额，修改【促销活动】后，不修改【客户折扣】，不修改【折后金额】，即使活动有折扣</strong></font></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="20%" align="right"><font color="#0000FF">合同号</font></td>
      <td width="30%"><%=hth%> </td>
      <td width="21%" align="right"><font color="#0000FF">客户姓名</font></td>
      <td width="29%"><%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">分公司</font></td>
      <td><%=fgsmc%> </td>
      <td align="right"><font color="#0000FF">签约店面</font></td>
      <td><%=dwmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">设计师</font></td>
      <td><%=sjs%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">工程原报价</font></td>
      <td><%=wdzgce%></td>
      <td align="right"><font color="#0000FF">签约额</font></td>
      <td><%=qye%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">合同减免额</font></td>
      <td><%=cdzwjmje%></td>
      <td align="right"><font color="#0000FF">管理费百分比</font></td>
      <td><%=glfbfb%>%</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">折前管理费</font></td>
      <td><%=zqguanlif%></td>
      <td align="right"><font color="#0000FF">折后管理费</font></td>
      <td><%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">管理费减免额</font></td>
      <td><%=glfjmje%></td>
      <td align="right"><font color="#0000FF">税金减免额</font></td>
      <td><%=sjjmje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">税金百分比</font></td>
      <td><%=suijinbfb%> % </td>
      <td align="right"><font color="#0000FF">税金</font></td>
      <td><%=suijin%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">折前未记入签约额项目</font></td>
      <td><%=zqwjrqyexm%></td>
      <td align="right"><font color="#0000FF">折后未记入签约额项目</font></td>
      <td><%=zhwjrqyexm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">未记入签约额项目说明</font></td>
      <td colspan="3"><%=wjrqyexmsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">设计费</font></td>
      <td><%=sjf%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>

  <center><b>电子报价综合取费</b></center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">收费项目</td>
	<td  width="8%">收费计算方式</td>
	<td  width="4%">百分比</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="5%">单价</td>
	<td  width="6%">折前金额</td>
	<td  width="3%">单项折扣</td>
	<td  width="6%">折后金额</td>
	<td  width="4%">记入签约额</td>
	<td  width="4%">记入税金</td>
	<td  width="4%">记入管理费</td>
	<td  width="4%">是否可打折</td>
	<td  width="3%">最低折扣</td>
	<td  width="6%">收费项目类型</td>
	<td  width="4%">施工队结算</td>
	<td  width="20%">备注</td>
</tr>

 <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx ";
	ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打','Y','可打') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','公司购主材间接费','5','工程管理费','6','工程税金','7','公司购主材管理费','8','公司购主材税金','A','自购主材管理费','B','自购主材税金','C','自购主材间接费','D','水电路','9','其它') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','否','Y','是') sfcysgdjs,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_sfxmmx.sfxmbm";

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>


<BR>
<form method="post" action="SaveInsertCw_cxhdxgjl1.jsp" name="insertform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">修改前公司促销活动</font></td>
      <td colspan="3"><%=cxhdbm%>
      <input type="hidden" name="xgqcxhd" value="<%=cxhdbm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">修改前小区促销活动</font></td>
      <td colspan="3"><%=cxhdbmxq%>
      <input type="hidden" name="xgqcxhdbmxq" value="<%=cxhdbmxq%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">修改前展会促销活动</font></td>
      <td colspan="3"><%=cxhdbmzh%>
      <input type="hidden" name="xgqcxhdbmzh" value="<%=cxhdbmzh%>" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">修改后公司促销活动</td>
      <td colspan="3"> 
        <select name="xghcxhd" style="FONT-SIZE:12PX;WIDTH:530PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc","");
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">修改后小区促销活动</td>
      <td colspan="3"> 
        <select name="xghcxhdbmxq" style="FONT-SIZE:12PX;WIDTH:530PX" onKeyUp="keyGo(yhyy)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc","");
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">修改后展会促销活动</td>
      <td colspan="3"> 
        <select name="xghcxhdbmzh" style="FONT-SIZE:12PX;WIDTH:530PX" onKeyUp="keyGo(yhyy)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(订金：'||jc_cxhd.dj||'￥)' c2 from jc_cxhd where jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
      <td width="30%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
      <td width="29%"> 
      <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">录入部门</font></td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
      </select>      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="hidden" name="khxm" value="<%=khxm%>" >
	  <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
        <input type="hidden" name="xgjlh" value="<%=xgjlh%>"></td>
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
	if(	javaTrim(FormName.xgjlh)=="") {
		alert("请输入[修改记录号]！");
		FormName.xgjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	if(	javaTrim(FormName.bz)=="") {
		alert("请选择[备注]！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
