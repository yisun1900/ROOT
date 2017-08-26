<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改结算 </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String gdjsjlh=request.getParameter("gdjsjlh");

///////////////基础数据
String khbh=null;
String sgd=null;
String khlx=null;
String cxhdbm=null;
double zkl=0;
double wdzgce=0;
double qye=0;
double zjxje=0;
double zhzjxje=0;
double zqwgzj=0;
double zhwgzj=0;
double khsskze=0;
double glftd=0;
double glf=0;
double gdjskze=0;

///////////////代扣款项目
double clf=0;
double bzclfbl=0;
double xbclk=0;
double psgjgff=0;
double ysf=0;
double wxjbfb=0;
double wxj=0;
double gcjxkk=0;
double sj=0;
double lbcb=0;
double kqtk=0;

///////////////结算金额
double jkje=0;
double sqgz=0;
double gczxjl=0;
double ycfbk=0;

String jslx=null;
String jsr=null;
String jsdw=null;
String jssj=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
String fgsbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double sjclf=0;
double tlk=0;


try {
	conn=cf.getConnection();

	ls_sql="select khbh,sgd,khlx,cxhdbm,zkl,wdzgce,qye,zjxje,zhzjxje ";
	ls_sql+=" ,zqwgzj,zhwgzj,khsskze,glftd,glf,gdjskze,clf,bzclfbl,xbclk,psgjgff ";
	ls_sql+=" ,ysf,wxjbfb,wxj,gcjxkk,sj,lbcb,kqtk,jkje,sqgz,gczxjl ";
	ls_sql+=" ,ycfbk,jslx,jsdw,jsr,jssj,bz,jsjd,fkbz ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		khlx=cf.fillNull(rs.getString("khlx"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zkl=rs.getDouble("zkl");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		zqwgzj=rs.getDouble("zqwgzj");
		zhwgzj=rs.getDouble("zhwgzj");
		khsskze=rs.getDouble("khsskze");
		glftd=rs.getDouble("glftd");
		glf=rs.getDouble("glf");
		gdjskze=rs.getDouble("gdjskze");
		clf=rs.getDouble("clf");
		bzclfbl=rs.getDouble("bzclfbl");
		xbclk=rs.getDouble("xbclk");
		psgjgff=rs.getDouble("psgjgff");

		ysf=rs.getDouble("ysf");
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		gcjxkk=rs.getDouble("gcjxkk");
		sj=rs.getDouble("sj");
		lbcb=rs.getDouble("lbcb");
		kqtk=rs.getDouble("kqtk");
		jkje=rs.getDouble("jkje");
		sqgz=rs.getDouble("sqgz");
		gczxjl=rs.getDouble("gczxjl");

		ycfbk=rs.getDouble("ycfbk");
		jslx=cf.fillNull(rs.getString("jslx"));
		jsdw=cf.fillNull(rs.getString("jsdw"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select fgsbh,jzbz,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
	}
	rs.close();
	ps.close();

	//材料费
	ls_sql="select sum(cl_ckmx.ckje)";
	ls_sql+=" from  cl_ckd,cl_ckmx";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.khbh='"+khbh+"'";
	ls_sql+=" and cl_ckd.lx='1'  and cl_ckmx.cldlmc!='杂项'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjclf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//其它收费
	double allqtsf=0;
	ls_sql="select sum(cl_ckd.qtsf)";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where cl_ckd.khbh='"+khbh+"' and cl_ckd.lx='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqtsf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//退料款
	ls_sql="select sum(-1*cl_ckmx.ckje)";
	ls_sql+=" from  cl_ckd,cl_ckmx";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.khbh='"+khbh+"'";
	ls_sql+=" and cl_ckd.lx='2'  and cl_ckmx.cldlmc!='杂项'";//1：出库；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tlk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//其它收费
	ls_sql="select sum(cl_ckd.qtsf)";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where cl_ckd.khbh='"+khbh+"' and cl_ckd.lx='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqtsf=allqtsf-rs.getDouble(1);
	}
	rs.close();
	ps.close();

	sjclf=cf.doubleTrim(sjclf-tlk+allqtsf);

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">施工队中期结算（结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right">客户编号</td>
              <td><%=khbh%></td>
              <td align="right">合同号</td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">客户姓名</div>
              </td>
              <td><%=khxm%> </td>
              <td> 
                <div align="right">质检姓名</div>
              </td>
              <td><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">签约店面</div>
              </td>
              <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td> 
                <div align="right">设计师</div>
              </td>
              <td><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">签约日期</td>
              <td><%=qyrq%></td>
              <td align="right">实际完结日期</td>
              <td><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">合同开工日期</td>
              <td><%=kgrq%></td>
              <td align="right">合同竣工日期</td>
              <td><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">实际开工日期</td>
              <td><%=sjkgrq%></td>
              <td align="right">实际竣工日期</td>
              <td><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="28" colspan="4" align="center"><b><font color="#000099">基础数据</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">施工队</font></td>
              <td> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">客户类型</font></td>
              <td> 
                <select name="khlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+非加活动客户&2+参加活动客户",khlx,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">参加促销活动</font></td>
              <td> 
                <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">折扣率</font></td>
              <td> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">工程原报价</font></td>
              <td> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">工程签约额</font></td>
              <td> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">折前增减项金额</font></td>
              <td> 
                <input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">折后增减项金额</font></td>
              <td> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">折前完工造价</font></td>
              <td> 
                <input type="text" name="zqwgzj" value="<%=zqwgzj%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">折后完工造价</font></td>
              <td> 
                <input type="text" name="zhwgzj" value="<%=zhwgzj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">家装实收款总额</font></td>
              <td> 
                <input type="text" name="khsskze" value="<%=khsskze%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">管理费比率</td>
              <td> 
                <input type="text" name="glftd" value="<%=glftd%>" size="10" maxlength="17" onChange="f_jsglf(insertform)">
                % </td>
              <td align="right"><font color="#0000FF">管理费</font></td>
              <td> 
                <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">应付工费</font></td>
              <td colspan="3"> 
                <input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="17" readonly>
                &nbsp;&nbsp;<b>应付工费＝折后完工造价×（1-管理费比例）</b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" height="30" align="center"><b><font color="#000099">代扣款项目</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">标准材料费比率</td>
              <td width="32%">
                <input type="text" name="bzclfbl" value="<%=bzclfbl%>" size="10" maxlength="17" onChange="f_clfbl(insertform)">
                % </td>
              <td width="18%" align="right">材料费</td>
              <td width="32%">
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">材料扣款</td>
              <td colspan="3"><b> 
                <input type="text" name="xbclk" value="<%=xbclk%>" size="20" maxlength="17" >
                材料扣款：材料费金额不足18%时的部分做为材料扣款</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">配送工具工服费</td>
              <td width="32%"> 
                <input type="text" name="psgjgff" value="<%=psgjgff%>" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">运输费</td>
              <td width="32%"> 
                <input type="text" name="ysf" value="<%=ysf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">扣质保金百分比</td>
              <td width="32%"> 
                <input type="text" name="wxjbfb" value="<%=wxjbfb%>" size="10" maxlength="17" >
                % </td>
              <td width="18%" align="right">扣质保金</td>
              <td width="32%"> 
                <input type="text" name="wxj" value="<%=wxj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">工程减项扣款</td>
              <td width="32%"> 
                <input type="text" name="gcjxkk" value="<%=gcjxkk%>" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">税金</td>
              <td width="32%"> 
                <input type="text" name="sj" value="<%=sj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">立邦成本</td>
              <td width="32%"> 
                <input type="text" name="lbcb" value="<%=lbcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
              </td>
              <td width="18%" align="right">其它扣款</td>
              <td width="32%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4" height="22"><b><font color="#000099">结算金额</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">前期已拨工费</td>
              <td width="32%"> 
                <input type="text" name="jkje" value="<%=jkje%>" size="20" maxlength="17" readonly>
              </td>
              <td width="18%" align="right">应拨工费</td>
              <td width="32%"> 
                <input type="text" name="sqgz" value="<%=sqgz%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right"><b>应拨工费=</b><font color="#003399">应付工费-材料费+退料款-材料扣款-配送工具工服费-运输费-扣质保金-工程减项扣款-税金-立邦成本-其它扣款-前期已拨工费</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">工程增项奖励</td>
              <td width="32%"> 
                <input type="text" name="gczxjl" value="<%=gczxjl%>" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">远程费拨款</td>
              <td width="32%"> 
                <input type="text" name="ycfbk" value="<%=ycfbk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="25">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">结算类型</font></td>
              <td> 
                <select name="jslx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+完工结算&2+中期结算",jslx,false);
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">结算单位</font></td>
              <td> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'",jsdw);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" value="<%=jsr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算时间</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jssj" value="<%=jssj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button" onClick="window.open('/cwgl/kqtk/Cw_kqtkjlCxList.jsp?fgs=<%=fgsbh%>&khbh=<%=khbh%>&cw_kqtkjl_jsbz=Y&cw_kqtkjl_jsjlh=<%=gdjsjlh%>')" value="其它扣款明细">
                  <input type="button" onClick="window.open('/cwgl/sgdjk/Cw_gdjkjlCxList.jsp?crm_khxx_sgd=<%=sgd%>&fgs=<%=fgsbh%>&scbz=N&cw_gdjkjl_gdjsjd=1&cw_gdjkjl_gdjsjlh=<%=gdjsjlh%>')" value="前期拨款记录">
                  <input type="button" onClick="window.open('/fcgl/cl_ckd/Cl_ckdCxList.jsp?khbh=<%=khbh%>&fgs=<%=fgsbh%>&myxssl=30&jsbz=Y&jsjlh=<%=gdjsjlh%>')" value="材料出库明细" >
                  <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
                  <input name="button" type="button" onClick="window.open('/cwgl/sgdjs/DyWgDzd.jsp?khbh=<%=khbh%>')" value="完工对账单" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
				<input type="button"  value="查看『施工队质保金』" onClick="window.open('/cwgl/zbjgl/cx/ViewSgdZbj.jsp?sgd='+sgd.value)">
                </p>
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
function f_clfbl(FormName)
{
	var bzclf=0;//材料费
	bzclf=<%=zhwgzj%>*FormName.bzclfbl.value/100;
	bzclf=round(bzclf,2);

	var xbclk=0;//材料扣款
	if (bzclf > <%=sjclf%> )//材料扣款：材料费金额不足18%时的部分做为材料扣款
	{
		xbclk=round(bzclf-<%=sjclf%>);//材料扣款：材料费金额不足18%时的部分做为材料扣款
	}
	
	FormName.xbclk.value=xbclk;
}

function f_jsglf(FormName)//参数FormName:Form的名称
{
	//基础数据
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.khlx)=="") {
		alert("请选择[客户类型]！");
		FormName.khlx.focus();
		return false;
	}
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请选择[参加促销活动]！");
		FormName.cxhdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[折前增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "折前增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("请输入[折后增减项金额]！");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "折后增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zqwgzj)=="") {
		alert("请输入[折前完工造价]！");
		FormName.zqwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqwgzj, "折前完工造价"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwgzj)=="") {
		alert("请输入[折后完工造价]！");
		FormName.zhwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhwgzj, "折后完工造价"))) {
		return false;
	}
	if(	javaTrim(FormName.khsskze)=="") {
		alert("请输入[客户实收款总额]！");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "客户实收款总额"))) {
		return false;
	}

	if(	javaTrim(FormName.glftd)=="") {
		alert("请输入[管理费比率]！");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "管理费比率"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[管理费]！");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.gdjskze)=="") {
		alert("请输入[应付工费]！");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "应付工费"))) {
		return false;
	}

	
	var glf=0;
	glf=<%=zhwgzj%>*FormName.glftd.value/100;//折后完工造价×管理费比例
	glf=round(glf,2);
	FormName.glf.value=glf;

	var gdjskze=0;//应付工费
	gdjskze=<%=zhwgzj%>-glf;//折后完工造价×管理费比例
	gdjskze=round(gdjskze,2);
	FormName.gdjskze.value=gdjskze;

	
	var wxj=0;//扣质保金=应付工费*扣质保金百分比
	wxj=FormName.htwgzj.value/100.0*FormName.wxjbfb.value;
	wxj=round(wxj,2);
	FormName.wxj.value=wxj;


	//代扣款项目
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("请输入[标准材料费比率]！");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "标准材料费比率"))) {
		return false;
	}
	if(	javaTrim(FormName.xbclk)=="") {
		alert("请输入[材料扣款]！");
		FormName.xbclk.focus();
		return false;
	}
	if(!(isFloat(FormName.xbclk, "材料扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.psgjgff)=="") {
		alert("请输入[配送工具工服费]！");
		FormName.psgjgff.focus();
		return false;
	}
	if(!(isFloat(FormName.psgjgff, "配送工具工服费"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("请输入[运输费]！");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "运输费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("请输入[扣质保金百分比]！");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "扣质保金百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.wxj)=="") {
		alert("请输入[扣质保金]！");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxkk)=="") {
		alert("请输入[工程减项扣款]！");
		FormName.gcjxkk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxkk, "工程减项扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sj)=="") {
		alert("请输入[税金]！");
		FormName.sj.focus();
		return false;
	}
	if(!(isFloat(FormName.sj, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.lbcb)=="") {
		alert("请输入[立邦成本]！");
		FormName.lbcb.focus();
		return false;
	}
	if(!(isFloat(FormName.lbcb, "立邦成本"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("请输入[其它扣款]！");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "其它扣款"))) {
		return false;
	}
	

	
	//结算金额
	if(	javaTrim(FormName.jkje)=="") {
		alert("请输入[前期已拨工费]！");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "前期已拨工费"))) {
		return false;
	}

	
	var sqgz=0;//应拨工费
	//应拨工费=应付工费-材料费-材料扣款-配送工具工服费-运输费   -扣质保金-工程减项扣款-税金-立邦成本-其它扣款-前期已拨工费
	sqgz=FormName.gdjskze.value-FormName.clf.value*1.0-FormName.xbclk.value-FormName.psgjgff.value-FormName.ysf.value;
	sqgz=sqgz-FormName.wxj.value-FormName.gcjxkk.value-FormName.sj.value-FormName.lbcb.value-FormName.kqtk.value-FormName.jkje.value;
	sqgz=round(sqgz,2);
	FormName.sqgz.value=sqgz;

}


function f_do(FormName)//参数FormName:Form的名称
{
	//基础数据
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.khlx)=="") {
		alert("请选择[客户类型]！");
		FormName.khlx.focus();
		return false;
	}
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请选择[参加促销活动]！");
		FormName.cxhdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[折前增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "折前增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("请输入[折后增减项金额]！");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "折后增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zqwgzj)=="") {
		alert("请输入[折前完工造价]！");
		FormName.zqwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqwgzj, "折前完工造价"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwgzj)=="") {
		alert("请输入[折后完工造价]！");
		FormName.zhwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhwgzj, "折后完工造价"))) {
		return false;
	}
	if(	javaTrim(FormName.khsskze)=="") {
		alert("请输入[客户实收款总额]！");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "客户实收款总额"))) {
		return false;
	}

	if(	javaTrim(FormName.glftd)=="") {
		alert("请输入[管理费比率]！");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "管理费比率"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[管理费]！");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.gdjskze)=="") {
		alert("请输入[应付工费]！");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "应付工费"))) {
		return false;
	}

	//代扣款项目
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("请输入[标准材料费比率]！");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "标准材料费比率"))) {
		return false;
	}
	if(	javaTrim(FormName.xbclk)=="") {
		alert("请输入[材料扣款]！");
		FormName.xbclk.focus();
		return false;
	}
	if(!(isFloat(FormName.xbclk, "材料扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.psgjgff)=="") {
		alert("请输入[配送工具工服费]！");
		FormName.psgjgff.focus();
		return false;
	}
	if(!(isFloat(FormName.psgjgff, "配送工具工服费"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("请输入[运输费]！");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "运输费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("请输入[扣质保金百分比]！");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "扣质保金百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.wxj)=="") {
		alert("请输入[扣质保金]！");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxkk)=="") {
		alert("请输入[工程减项扣款]！");
		FormName.gcjxkk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxkk, "工程减项扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sj)=="") {
		alert("请输入[税金]！");
		FormName.sj.focus();
		return false;
	}
	if(!(isFloat(FormName.sj, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.lbcb)=="") {
		alert("请输入[立邦成本]！");
		FormName.lbcb.focus();
		return false;
	}
	if(!(isFloat(FormName.lbcb, "立邦成本"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("请输入[其它扣款]！");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "其它扣款"))) {
		return false;
	}
	
	
	//结算金额
	if(	javaTrim(FormName.jkje)=="") {
		alert("请输入[前期已拨工费]！");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "前期已拨工费"))) {
		return false;
	}
	if(	javaTrim(FormName.sqgz)=="") {
		alert("请输入[应拨工费]！");
		FormName.sqgz.focus();
		return false;
	}
	if(!(isFloat(FormName.sqgz, "应拨工费"))) {
		return false;
	}
	if(	javaTrim(FormName.gczxjl)=="") {
		alert("请输入[工程增项奖励]！");
		FormName.gczxjl.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxjl, "工程增项奖励"))) {
		return false;
	}
	if(	javaTrim(FormName.ycfbk)=="") {
		alert("请输入[远程费拨款]！");
		FormName.ycfbk.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfbk, "远程费拨款"))) {
		return false;
	}



	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[结算人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[结算时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jslx)=="") {
		alert("请选择[结算类型]！");
		FormName.jslx.focus();
		return false;
	}
	if(	javaTrim(FormName.jsdw)=="") {
		alert("请选择[结算单位]！");
		FormName.jsdw.focus();
		return false;
	}
	
	f_jsglf(FormName);

	FormName.action="SaveEditWgCw_gdjsjl.jsp";
	FormName.submit();
	FormName.dejs.disabled=false;
	return true;
}

//-->
</SCRIPT>
