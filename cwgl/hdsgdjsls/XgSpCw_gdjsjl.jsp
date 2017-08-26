<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khjskze=null;
String khsskze=null;
String sjcb=null;
String sj=null;
String tdjs=null;
String sptdjs=null;
String glftd=null;
String glf=null;
String clf=null;
String zgclf=null;
String jkje=null;
String kwxf=null;
String spgckk=null;
String ksdf=null;
String kqtk=null;
String bk=null;
String bz=null;
String zjxxh=null;
double tdjsje=0;

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
String sgd=null;
String zjxm=null;
String jzbz=null;
double qye=0;
double wdzgce=0;
double xjqye=0;

double zhzjxje=0;
double zjxje=0;
double sfke=0;
double zkl=0;
//double bk=0;

double hbssk=0;//环保项目实收款

String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;
String jsr=null;
String jssj=null;
String jsfs =null;
double sgdfk=0;
double sjsfk=0;
double dejsje=0;
double xbclk=0;
double cbje=0;
double sgdglftd =0;
double gdjskze=0;


String spr=null;
String spsj=null;
String spjl=null;
String spyj=null;
double wxj=0;//维修金
double wxjbfb=0;//维修金

String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wxjbfb,wxj,spr,spsj,spjl,spyj,khbh,khjskze,khsskze,sjcb,sj,tdjs,glftd,glf,clf,zgclf,jkje,kwxf,ksdf,kqtk,bk,bz,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,cbje,sgdglftd,gdjskze  ";
	ls_sql+=" ,jsr,jssj,sgdfk,sjsfk,dejsje,xbclk,jsfs";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spyj=cf.fillNull(rs.getString("spyj"));

		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		sgdfk=rs.getDouble("sgdfk");
		sjsfk=rs.getDouble("sjsfk");
		dejsje=rs.getDouble("dejsje");
		xbclk=rs.getDouble("xbclk");
		jsfs=cf.fillNull(rs.getString("jsfs"));

		
		khbh=cf.fillNull(rs.getString("khbh"));
		khjskze=cf.fillNull(rs.getString("khjskze"));
		khsskze=cf.fillNull(rs.getString("khsskze"));
		sjcb=cf.fillNull(rs.getString("sjcb"));
		sj=cf.fillNull(rs.getString("sj"));
		tdjs=cf.fillNull(rs.getString("tdjs"));
		glftd=cf.fillNull(rs.getString("glftd"));
		glf=cf.fillNull(rs.getString("glf"));
		clf=cf.fillNull(rs.getString("clf"));
		zgclf=cf.fillNull(rs.getString("zgclf"));
		jkje=cf.fillNull(rs.getString("jkje"));
		kwxf=cf.fillNull(rs.getString("kwxf"));
		ksdf=cf.fillNull(rs.getString("ksdf"));
		kqtk=cf.fillNull(rs.getString("kqtk"));
		//bk=cf.fillNull(rs.getDouble("bk"));
		bk=cf.fillNull(rs.getString("bk"));
		bz=cf.fillNull(rs.getString("bz"));
		tdjsje=rs.getDouble("tdjsje");
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
		cbje=rs.getDouble("cbje");
		sgdglftd=rs.getDouble("sgdglftd");
		gdjskze=rs.getDouble("gdjskze");
	}
	rs.close();
	ps.close();
	if (bk.equals(""))
	{
		bk="0";
	}
	
	ls_sql="select zjxxh,zhzjxje,zkl,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		zhzjxje=rs.getDouble("zhzjxje");
		zkl=rs.getDouble("zkl");
		zjxje=rs.getDouble("zjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");

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

	if (jzbz.equals(""))
	{
		jzbz="1";
	}

	if (jsfs.equals("1"))//1：计提管理费；2：定额结算
	{
		wxj=((int)(tdjsje*0.03*100+0.5))/100.0;
	}
	else{
		wxj=((int)(dejsje*0.03*100+0.5))/100.0;
	}

	//环保项目
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='92' and scbz='N'";//92：环保项目
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=rs.getDouble(1);//已收环保项目款
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='92' and scbz='N'";//转出环保项目款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=hbssk-rs.getDouble(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>工队结算-审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 工队结算-审批（结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveSpCw_gdjsjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">客户编号</td>
              <td width="30%"><%=khbh%></td>
              <td align="right" width="21%">合同号</td>
              <td width="29%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="30%"><%=khxm%> </td>
              <td width="21%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="29%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="21%"> 
                <div align="right">设计师</div>
              </td>
              <td width="29%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">签约日期</td>
              <td width="30%"><%=qyrq%></td>
              <td align="right" width="21%">实际完结日期</td>
              <td width="29%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">合同开工日期</td>
              <td width="30%"><%=kgrq%></td>
              <td align="right" width="21%">合同竣工日期</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">实际开工日期</td>
              <td width="30%"><%=sjkgrq%></td>
              <td align="right" width="21%">实际竣工日期</td>
              <td width="29%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">施工队</font></td>
              <td width="30%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="21%"><font color="#0000FF">家装标志</font></td>
              <td width="29%"> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">家装签约额</font></td>
              <td width="30%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">工程原报价</font></td>
              <td width="29%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">折后累计增减项</font></td>
              <td width="30%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">折前累计增减项</font></td>
              <td width="29%"><%=zjxje %></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">工程实际发生额</font></td>
              <td width="30%"><%=(qye+zhzjxje  )%>（<font color="#0000FF">签约额</font>＋<font color="#0000FF">折后增减项</font>） 
              </td>
              <td align="right" width="21%"><font color="#0000FF">工程实收款总额</font></td>
              <td width="29%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">折扣率</font></td>
              <td width="30%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="3" colspan="4" align="center" bgcolor="#FFFFCC">结算信息</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>结算方式</td>
              <td width="30%"><%
	cf.radioToken(out, "jsfs","1+计提管理费&2+定额结算",jsfs);
%></td>
              <td align="right" width="21%">客户结算金额</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">提点基数</div>
              </td>
              <td width="30%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+客户结算金额&2+实收款&3+签约额&4+实际成本&9+其它",tdjs);
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">提点基数金额</div>
              </td>
              <td width="29%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">施工队承担工程扣款</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="21%" align="right">设计师承担工程扣款</td>
              <td width="29%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">质检承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="21%"> 
                <div align="right">公司承担工程扣款</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">其它方承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000CC">工程扣款</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">施工队罚款</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="21%">设计师罚款</td>
              <td width="29%"> 
                <input type="text" name="sjsfk" value="<%=sjsfk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#990000">基价金额</font> </td>
              <td><input type="text" name="cbje" value="<%=cbje%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
              <td align="right"><font color="#993300">施工队管理费率</font></td>
              <td>                  <font color="#993300">
<input type="text" name="sgdglftd" value="<%=sgdglftd%>" size="8" maxlength="8" onChange="calValue(editform)">              
%</font><font color="#990000">(定额结算费率</font><font color="#993300">）</font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#993300">施工队结算总金额</font> </td>
              <td><input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#993300">施工队结算费率</font></td>
              <td bgcolor="#FFFFCC"><input type="text" name="jsglftd" value="" size="8" maxlength="8" >
                  <font color="#993300">%</font><font color="#990000">(系统自动计算） </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">定额结算金额</font></td>
              <td width="30%"><%=dejsje%></td>
              <td width="21%" align="right"><font color="#0000CC">需补材料款</font></td>
              <td width="29%"><%=xbclk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">结算人</td>
              <td width="30%"><%=jsr%></td>
              <td width="21%" align="right">结算时间</td>
              <td width="29%"><%=jssj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">备注</td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="2" colspan="4" align="center" bgcolor="#FFFFCC">审批信息</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">管理费提点</td>
              <td bgcolor="#FFFFCC" width="30%"> 
<input type="text" name="glftd" size="10" maxlength="17"  value="<%=glftd%>"  >                
% </td>
              <td align="right" bgcolor="#FFFFCC" width="21%">补款</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="bk" size="20" maxlength="17"  value="<%=bk%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">维修金百分比</td>
              <td bgcolor="#FFFFCC" width="30%"> 
                <input name="wxjbfb" type="text" onChange="f_wxj(editform)"  value="<%=wxjbfb%>" size="10" maxlength="17">
                % </td>
              <td align="right" bgcolor="#FFFFCC" width="21%">维修金</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="wxj" size="20" maxlength="17"  value="<%=wxj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">审批结论</td>
              <td bgcolor="#FFFFCC" width="30%"> 
<%
	cf.radioToken(out, "spjl","3+同意&4+不同意",spjl);
%>
              </td>
              <td bgcolor="#FFFFCC" width="21%">&nbsp;</td>
              <td bgcolor="#FFFFCC" width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFCC" width="20%"> 
                <div align="right">审批人</div>
              </td>
              <td bgcolor="#FFFFCC" width="30%"> 
                <input type="text" name="spr" size="20" maxlength="20"  value="<%=spr%>" readonly>
              </td>
              <td bgcolor="#FFFFCC" width="21%"> 
                <div align="right">审批时间</div>
              </td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="spsj" size="20" maxlength="10"  value="<%=spsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">审批意见</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <textarea name="spyj" cols="71" rows="3"><%=spyj%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <p> 
                  <input type="hidden" name="gdjsjlh"  value="<%=gdjsjlh%>" >
                    <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                    <input type="hidden" name="sjcb" value="<%=sjcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                    <input name="button3" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
                    <input name="dejs" type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="定额结算">
                    <input name="tjsbl" type="button" value="调整结算比例" onClick="window.open('EditCw_dejsmx.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                   </p>
                  <p> 
                    <input type="button" value="查看定额结算结果" onClick="window.open('ViewCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                    <input type="button" value="打印定额结算单(队长)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                    <input type="button" value="打印定额结算单(内部)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  </p>
               </div>
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
function f_jsglf(FormName)//参数FormName:Form的名称
{
	if (FormName.tdjs.value=='1')//1：客户结算金额；2：实收款；3：签约额； 4：实际成本；5：工程量；9：其它
	{
		FormName.tdjsje.value=FormName.khjskze.value;
	}
	else if (FormName.tdjs.value=='2')
	{
		FormName.tdjsje.value=<%=(sfke)%>;
	}
	else if (FormName.tdjs.value=='3')
	{
		FormName.tdjsje.value=<%=qye%>;
	}
	else if (FormName.tdjs.value=='4')
	{
		FormName.tdjsje.value=FormName.sjcb.value;
	}
	else if (FormName.tdjs.value=='9')
	{
	}

	if (FormName.jsfs[0].checked)
	{
		FormName.wxj.value=round(FormName.tdjsje.value*FormName.wxjbfb.value/100.0,2);
	}
	else{
		FormName.wxj.value=round(<%=dejsje%>*FormName.wxjbfb.value/100.0,2);
	}

}

function f_gckk(FormName)//参数FormName:Form的名称
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=parseInt(gk*100.0+0.5)/100.0;
	FormName.gckk.value=gk;
}
function calValue(FormName)
{  
	
	var gdjskze=FormName.cbje.value*(FormName.sgdglftd.value/100.0)+FormName.cbje.value*1.00;
	gdjskze=round(gdjskze,2);
	var tdjsje=FormName.tdjsje.value*1.0;
	jsglftd=1*((gdjskze*100.0)/tdjsje);
	jsglftd=round(jsglftd,2);
	FormName.gdjskze.value=gdjskze;
	FormName.jsglftd.value=jsglftd ; 
	FormName.glftd.value=round((100-FormName.jsglftd.value),2); 	
}    
function f_wxj(FormName)//参数FormName:Form的名称
{
	if (FormName.jsfs[0].checked)
	{
		FormName.wxj.value=round(FormName.tdjsje.value*FormName.wxjbfb.value/100.0,2);
	}
	else{
		FormName.wxj.value=round(<%=dejsje%>*FormName.wxjbfb.value/100.0,2);
	}
}
function f_do(FormName)//参数FormName:Form的名称
{
//	f_jsglf(FormName);


	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jzbz)=="") {
		alert("请选择[家装标志]！");
		FormName.jzbz.focus();
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
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("请输入[折后累计增减项]！");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "折后累计增减项"))) {
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

	if(	javaTrim(FormName.khsskze)=="") {
		alert("请输入[客户实收款总额]！");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "客户实收款总额"))) {
		return false;
	}
	if(	javaTrim(FormName.hbssk)=="") {
		alert("请输入[环保项目实收款]！");
		FormName.hbssk.focus();
		return false;
	}
	if(!(isFloat(FormName.hbssk, "环保项目实收款"))) {
		return false;
	}

	if(	!radioChecked(FormName.jsfs)) {
		alert("请选择[结算方式]！");
		FormName.jsfs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.khjskze)=="") {
		alert("请输入[客户结算金额]！");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "客户结算金额"))) {
		return false;
	}

	if (FormName.jsfs[1].checked)
	{
		//FormName.glftd.value="0"; 
		if(	javaTrim(FormName.cbje)=="") {
			alert("请输入[基价金额]！");
			FormName.cbje.focus();
			return false;
		}
		if (FormName.cbje.value=="0")
		{
			alert("错误！[定额方式结算的基价金额]不能为0！");
			FormName.cbje.focus();
			return false;
		}
		if(!(isFloat(FormName.cbje, "基价金额"))) {
			return false;
		}
		if(	javaTrim(FormName.sgdglftd)=="") {
			alert("请输入[施工队管理费率]！");
			FormName.sgdglftd.focus();
			return false;
		}
		if (FormName.sgdglftd.value=="0")
		{
			alert("错误！[定额方式结算的施工队管理费率]不能为0！");
			FormName.sgdglftd.focus();
			return false;
		}
		if (FormName.jsglftd.value<0 || FormName.jsglftd.value>=100)
		{
			alert("错误！[施工队结算总金额]不能高于[客户结算金额]！");
			FormName.gdjskze.select();
			return false;
		}
		if(!(isFloat(FormName.sgdglftd, "施工队管理费率"))) {
			return false;
		}	
		
	}	
    if (FormName.jsfs[0].checked)
	{	
		FormName.cbje.value="0"; 
	    FormName.sgdglftd.value="0"; 
	    FormName.gdjskze.value="0"; 
	    FormName.jsglftd.value="0"; 
		if(	javaTrim(FormName.tdjs)=="") {
			alert("请选择[提点基数]！");
			FormName.tdjs.focus();
			return false;
		}
		if(	javaTrim(FormName.tdjsje)=="") {
			alert("请输入[提点基数金额]！");
			FormName.tdjsje.focus();
			return false;
		}
		if(!(isFloat(FormName.tdjsje, "提点基数金额"))) {
			return false;
		}
		if(	javaTrim(FormName.glftd)=="") {
			alert("请输入[计提管理费率]！");
			FormName.glftd.focus();
			return false;
		}
		if (FormName.glftd.value=="0")
		{
			alert("错误！[计提管理费率]不能为0！");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "计提管理费率"))) {
			return false;
		}
		if (FormName.glftd.value<0 || FormName.glftd.value>=100)
		{
			alert("错误！[计提管理费率]应该在0和100之间！");
			FormName.glftd.select();
			return false;
		}	
	}

	if(!(isFloat(FormName.sjcb, "实际成本"))) {
		return false;
	}

	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("请输入[设计师承担费用]！");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "设计师承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("请输入[施工队承担费用]！");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "施工队承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("请输入[质检承担费用]！");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "质检承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("请输入[公司承担费用]！");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "公司承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("请输入[其它方承担费用]！");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "其它方承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请输入[施工队罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "施工队罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfk)=="") {
		alert("请输入[设计师罚款]！");
		FormName.sjsfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfk, "设计师罚款"))) {
		return false;
	}



	if (FormName.jsfs[0].checked)
	{
		if(	javaTrim(FormName.glftd)=="") {
			alert("请输入[管理费提点]！");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "管理费提点"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("请输入[维修金百分比]！");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "维修金百分比"))) {
		return false;
	}

	if(	javaTrim(FormName.wxj)=="") {
		alert("请输入[维修金]！");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "维修金"))) {
		return false;
	}
	if(	javaTrim(FormName.bk)=="") {
		alert("请输入[补款]！");
		FormName.bk.focus();
		return false;
	}
	if(!(isFloat(FormName.bk, "补款"))) {
		return false;
	}

	if(	!radioChecked(FormName.spjl)) {
		alert("请选择[审批结论]！");
		FormName.spjl[0].focus();
		return false;
	}

	if (FormName.spjl[1].checked)
	{
		if(	javaTrim(FormName.spyj)=="") {
			alert("请输入[审批意见]！");
			FormName.spyj.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.spr)=="") {
		alert("请输入[审批人]！");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("请输入[审批时间]！");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
