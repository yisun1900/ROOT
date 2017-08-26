<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010102")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String dqbm=null;
String bz=null;
String sfjms=null;
String hthqz=null;
String cxbz=null;
String ssfgs=null;
String bianma=null;
String cwdm=null;
String ssdqbm=null;
String dwflbm=null;
String ssfw=null;
String dwjb=null;
String kdsj=null;
String gdsj=null;
String dmxs=null;
String bzrs=null;

String jcppbz=null;
String zcmmbz=null;
String mmbz=null;
String cgjjbz=null;
String jjbz=null;
String zxkhlrjc=null;
String zxkhlrts=null;
String qdkhbljc=null;
String qdkhblts=null;
String dzbjjc=null;
String hfsjzdsz=null;
String xmzyglbz=null;
String jjgwglbz=null;
String jcddblxs=null;
String jcddmxblxs=null;
String kfdh=null;
String jjsjsglbz=null;
String khxxglsj=null;
String djlrfs=null;
String kgcxhdbl=null;
String xuhao=null;
double bzlybl=0;
double lyblxx=0;
double lyblsx=0;
String dhqh=null;


String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String dzbjbz=null;
double jryjbfb=0;
double sjjryjbfb=0;

Reader is=null;
BufferedReader br=null;

try {
	conn=cf.getConnection();

	oracle.sql.CLOB  clob=null;
	
	ls_sql="select khxxglsj,jjsjsglbz,kfdh,sjjryjbfb,jcddblxs,jcddmxblxs,jjgwglbz,jcppbz,zcmmbz,mmbz,cgjjbz,jjbz,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,dzbjjc,hfsjzdsz,xmzyglbz ,jryjbfb,dwjb,ssfw,dwbh,dwmc,dwjc,ssdw,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz,dqbm,sfjms,hthqz,cxbz,ssfgs,bianma,cwdm,ssdqbm,dwflbm,kdsj,gdsj,dmxs,bzrs";
	ls_sql+=" ,djlrfs,kgcxhdbl,xuhao,bzlybl,lyblxx,lyblsx,dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bzlybl=rs.getDouble("bzlybl");
		lyblxx=rs.getDouble("lyblxx");
		lyblsx=rs.getDouble("lyblsx");

		xuhao=cf.fillNull(rs.getString("xuhao"));
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
		khxxglsj=cf.fillNull(rs.getDate("khxxglsj"));
		jjsjsglbz=cf.fillNull(rs.getString("jjsjsglbz"));
		kfdh=cf.fillNull(rs.getString("kfdh"));
		jcddblxs=cf.fillNull(rs.getString("jcddblxs"));
		jcddmxblxs=cf.fillNull(rs.getString("jcddmxblxs"));
		jcppbz=cf.fillNull(rs.getString("jcppbz"));
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		zxkhlrts=cf.fillNull(rs.getString("zxkhlrts"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		qdkhblts=cf.fillNull(rs.getString("qdkhblts"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
		xmzyglbz=cf.fillNull(rs.getString("xmzyglbz"));
		jjgwglbz=cf.fillNull(rs.getString("jjgwglbz"));

		sjjryjbfb=rs.getDouble("sjjryjbfb");
		jryjbfb=rs.getDouble("jryjbfb");
		dwjb=cf.fillNull(rs.getString("dwjb"));
		ssfw=cf.fillNull(rs.getString("ssfw"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwjc=cf.fillNull(rs.getString("dwjc"));
		ssdw=cf.fillNull(rs.getString("ssdw"));
		dwlx=cf.fillNull(rs.getString("dwlx"));
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwfzr=cf.fillNull(rs.getString("dwfzr"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		email=cf.fillNull(rs.getString("email"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sfjms=cf.fillNull(rs.getString("sfjms"));
		hthqz=cf.fillNull(rs.getString("hthqz"));
		cxbz=cf.fillNull(rs.getString("cxbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		ssdqbm=cf.fillNull(rs.getString("ssdqbm"));
		dwflbm=cf.fillNull(rs.getString("dwflbm"));
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));
		dmxs=cf.fillNull(rs.getString("dmxs"));
		bzrs=cf.fillNull(rs.getString("bzrs"));

	}
	rs.close();
	ps.close();

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+dwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		is=clob.getCharacterStream();
		br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}

		br.close();
		is.close();
	}
	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	try{
		br.close();
		is.close();

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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="button"  value="录入公司处理投诉部门" onClick="f_lrclts(editform)" name="lr2">              </td>
            </tr>
            <tr>
              <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位编号</font> </td>
              <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位名称</font></td>
                <td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000FF">编码</font></td>
              <td width="30%"><%=bianma%> 
                用于施工队等编码使用 </td>
              <td width="20%" align="right"><font color="#0000FF">电话区号</font></td>
              <td width="30%"><%=dhqh%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">单位电话</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">单位传真</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
            <tr> 
              <td width="20%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">备注</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
            </tr>
            
            <tr>
              <td bgcolor="#FFFFFF" align="right">财务代码</td>
              <td bgcolor="#FFFFFF"><input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">家装客户计入业绩收款比例</td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="jryjbfb" value="<%=jryjbfb%>" size="10" maxlength="20" >
                ％ (针对分公司)</td>
              <td align="right" bgcolor="#FFFFFF">设计客户计入业绩收款比例</td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="sjjryjbfb" value="<%=sjjryjbfb%>" size="10" maxlength="20" >
                ％ (针对分公司)</td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">投诉报修供应商检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+无订单无法录入&N+无订单可录入",jcppbz);
%> <BR>
                <b><font color="#000099">投诉报修时，[供应商]下拉框如何取数据</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">主材收款检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zcmmbz","Y+无订单不能收款&N+无订单可收款&M+可空",zcmmbz);
%>
                  <BR>
                  <b><font color="#000099">财务收主材款时，[收款品牌]下拉框如何取数据</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">木门收款检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "mmbz","Y+无订单不能收款&N+无订单可收款&M+可空",mmbz);
%>
                  <BR>
                  <b><font color="#000099">财务收木门款时，[收款品牌]下拉框如何取数据</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">橱柜收款检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "cgjjbz","Y+无订单不能收款&N+无订单可收款&M+可空",cgjjbz);
%>
                  <BR>
              <b><font color="#000099">财务收橱柜款时，[收款品牌]下拉框如何取数据</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">家具收款检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjbz","Y+无订单不能收款&N+无订单可收款&M+可空",jjbz);
%>
                  <BR>
              <b><font color="#000099">财务收家具款时，[收款品牌]下拉框如何取数据</font></b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">启用回访时间自动设置（4位）</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="hfsjzdsz" value="<%=hfsjzdsz%>" size="10" maxlength="4" >
                <BR>
                <b><font color="#000099">根据工程部设置的工程进度，自动设置相应的客服回访时间，第1位：开工回访；第2位：隐蔽工程回访；第3位：中期回访；第4位：完工回访 
                ，1：设置；0：不设置</font> </b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">启用咨询客户录入检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+不启用&Y+启用",zxkhlrjc);
%><b><BR>
                <font color="#000099">咨询客户资料必须提前若干天录入，否则不允许做签单登记</font></b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">咨询客户提前录入天数</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="zxkhlrts" value="<%=zxkhlrts%>" size="10" maxlength="8" >
                <BR>
                <b><font color="#000099">签单登记中，[咨询录入时间]和[签单录入时间]允许相差最小天数</font>                </b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">启用签单客户补录检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+不启用&Y+启用",qdkhbljc);
%><BR>
                <b><font color="#000099">对补录签单客户进行限制，超过某几天后，不允许补录</font></b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">签单客户补录允许天数</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="qdkhblts" value="<%=qdkhblts%>" size="10" maxlength="8" >
                <BR>
                <b><font color="#000099">签单登记中，[签单录入时间]和[签约时间]允许相差最大天数</font></b>              </td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">集成订单对[<b>项目专员</b>]过滤</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "xmzyglbz","N+不过滤&Y+过滤",xmzyglbz);
%> <BR>
                <b><font color="#000099">集成家居订单对项目专员进行过滤，不属于自己的单不能看</font></b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">集成订单对[<b>家居顾问</b>]过滤</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjgwglbz","N+不过滤&Y+过滤",jjgwglbz);
%> <br>
                <b><font color="#000099">集成家居订单对家居顾问进行过滤，不属于自己的单不能看</font></b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">集成订单对[<b>家居设计师</b>]过滤</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjsjsglbz","N+不过滤&Y+过滤",jjsjsglbz);
%> <br>
                <b><font color="#000099">集成家居订单对家居设计师进行过滤，不属于自己的单不能看</font></b></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFCC" align="right">客户信息过滤时间</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <input type="text" name="khxxglsj" value="<%=khxxglsj%>" size="15" maxlength="10" onDblClick="JSCalendar(this)">
                <font color="#0000FF"><strong>（只需总部设置，分公司不需设置此参数）</strong> </font></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">启用电子报价检查</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]<BR>&2+2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]<BR>&3+3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免<BR>&6+6：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，记录减免<BR>&4+4：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改<BR>&7+7：[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改，可改其它优惠<BR>&5+5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]",dzbjjc);
%></td>
            </tr>
            <tr> 
              <td width="20%" bgcolor="#FFFFFF" align="right">集成订单保留小数</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddblxs","2+2位小数&1+1位小数&0+保留个位&-1+保留十位&-2+保留百位&-3+保留千位",jcddblxs);
%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">集成订单明细保留小数</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddmxblxs","2+2位小数&1+1位小数&0+保留个位&-1+保留十位&-2+保留百位&-3+保留千位",jcddmxblxs);
%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">主材订单单价录入方式</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "djlrfs","1+录入单价算折扣&2+录入折扣算单价&3+不可打折",djlrfs);
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">辅材－标准领用比例</td>
              <td><input type="text" name="bzlybl" size="14" maxlength="9"  value="<%=bzlybl%>" >
                百分比 </td>
              <td align="right">主材订单可改促销活动比例</td>
              <td><%
	cf.radioToken(out, "kgcxhdbl","Y+可改&N+不可改",kgcxhdbl);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">辅材领用比例－下限</td>
              <td><input type="text" name="lyblxx" size="14" maxlength="9"  value="<%=lyblxx%>" >
                百分比</td>
              <td align="right">辅材领用比例－上限 </td>
              <td><input type="text" name="lyblsx" size="14" maxlength="9"  value="<%=lyblsx%>" >
                百分比</td>
            </tr>
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="button"  value="录入公司处理投诉部门" onClick="f_lrclts(editform)" name="lr2">              </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}


		if(	javaTrim(FormName.bzlybl)=="") {
			alert("请输入[标准领用比例]！");
			FormName.bzlybl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzlybl, "标准领用比例"))) {
			return false;
		}
		if(	javaTrim(FormName.lyblxx)=="") {
			alert("请输入[领用比例下限]！");
			FormName.lyblxx.focus();
			return false;
		}
		if(!(isFloat(FormName.lyblxx, "领用比例下限"))) {
			return false;
		}
		if(	javaTrim(FormName.lyblsx)=="") {
			alert("请输入[领用比例上限]！");
			FormName.lyblsx.focus();
			return false;
		}
		if(!(isFloat(FormName.lyblsx, "领用比例上限"))) {
			return false;
		}


		if(	javaTrim(FormName.jryjbfb)=="") {
			alert("请选择[家装客户计入业绩收款比例]！");
			FormName.jryjbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.jryjbfb, "家装客户计入业绩收款比例"))) {
			return false;
		}

		if(parseFloat(FormName.jryjbfb.value)<0 || parseInt(FormName.jryjbfb.value)>100) 
		{
			alert("[家装客户计入业绩收款比例]错误！只能是0－100之间");
			FormName.jryjbfb.select();
			return false;
		}

		if(	javaTrim(FormName.sjjryjbfb)=="") {
			alert("请选择[设计客户计入业绩收款比例]！");
			FormName.sjjryjbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.sjjryjbfb, "设计客户计入业绩收款比例"))) {
			return false;
		}

		if(parseFloat(FormName.sjjryjbfb.value)<0 || parseInt(FormName.sjjryjbfb.value)>100) 
		{
			alert("[设计客户计入业绩收款比例]错误！只能是0－100之间");
			FormName.sjjryjbfb.select();
			return false;
		}

		
		if(	!radioChecked(FormName.jcppbz)) {
			alert("请选择[投诉报修供应商检查]！");
			FormName.jcppbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zcmmbz)) {
			alert("请选择[主材收款检查]！");
			FormName.zcmmbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.mmbz)) {
			alert("请选择[木门收款检查]！");
			FormName.mmbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.cgjjbz)) {
			alert("请选择[橱柜收款检查]！");
			FormName.cgjjbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjbz)) {
			alert("请选择[家具收款检查]！");
			FormName.jjbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zxkhlrjc)) {
			alert("请选择[启用咨询客户录入检查]！");
			FormName.zxkhlrjc[0].focus();
			return false;
		}
		if (FormName.zxkhlrjc[1].checked)
		{
			if(	javaTrim(FormName.zxkhlrts)=="") {
				alert("请选择[咨询客户提前录入天数]！");
				FormName.zxkhlrts.focus();
				return false;
			}
			if(!(isNumber(FormName.zxkhlrts, "咨询客户提前录入天数"))) {
				return false;
			}
		}
		else{
			FormName.zxkhlrts.value="";
		}


		if(	!radioChecked(FormName.qdkhbljc)) {
			alert("请选择[启用签单客户补录检查]！");
			FormName.qdkhbljc[0].focus();
			return false;
		}
		if (FormName.qdkhbljc[1].checked)
		{
			if(	javaTrim(FormName.qdkhblts)=="") {
				alert("请选择[签单客户补录允许天数]！");
				FormName.qdkhblts.focus();
				return false;
			}
			if(!(isNumber(FormName.qdkhblts, "签单客户补录允许天数"))) {
				return false;
			}
		}
		else{
			FormName.qdkhblts.value="";
		}

		if(	!radioChecked(FormName.dzbjjc)) {
			alert("请选择[启用电子报价检查]！");
			FormName.dzbjjc[0].focus();
			return false;
		}

		if(	javaTrim(FormName.hfsjzdsz)=="") {
			alert("请选择[启用回访时间自动设置]！");
			FormName.hfsjzdsz.focus();
			return false;
		}
		if (FormName.hfsjzdsz.value.length!=4)
		{
			alert("[启用回访时间自动设置]必须4位！");
			FormName.hfsjzdsz.focus();
			return false;
		}


		if(	!radioChecked(FormName.xmzyglbz)) {
			alert("请选择[集成订单对项目专员过滤]！");
			FormName.xmzyglbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjgwglbz)) {
			alert("请选择[集成订单对家居顾问过滤]！");
			FormName.jjgwglbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjsjsglbz)) {
			alert("请选择[集成订单对家居设计师过滤标志]！");
			FormName.jjsjsglbz[0].focus();
			return false;
		}


		if(	!radioChecked(FormName.jcddblxs)) {
			alert("请选择[集成订单保留小数]！");
			FormName.jcddblxs[0].focus();
			return false;
		}

		if(	!radioChecked(FormName.jcddmxblxs)) {
			alert("请选择[集成订单明细保留小数]！");
			FormName.jcddmxblxs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.djlrfs)) {
			alert("请选择[主材订单单价录入方式]！");
			FormName.djlrfs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.kgcxhdbl)) {
			alert("请选择[主材订单可改促销活动比例]！");
			FormName.kgcxhdbl[0].focus();
			return false;
		}
		if (FormName.djlrfs[2].checked)
		{
			if (FormName.kgcxhdbl[0].checked)
			{
				alert("错误！单价不可打折，必须选择【不可改】");
				FormName.kgcxhdbl[1].focus();
				return false;
			}
		}

	

	if(!(isDatetime(FormName.khxxglsj, "客户信息过滤时间"))) {
		return false;
	}

		if(	javaTrim(FormName.khxxglsj)=="") {
			alert("请选择[客户信息过滤时间]！");
			FormName.khxxglsj.focus();
			return false;
		}



	FormName.action="SaveEditFcblSq_dwxx.jsp";
	FormName.submit();
	return true;
}

function f_lrxmzy(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_xmzy.jsp";
	FormName.submit();
	return true;
}

function f_lrclts(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_tsclbm.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="Sq_xmzyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











