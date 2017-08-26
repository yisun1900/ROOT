<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看结算 </title>
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
      <div align="center">施工队结算（结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="button" onClick="window.open('/cwgl/kqtk/Cw_kqtkjlCxList.jsp?fgs=<%=fgsbh%>&khbh=<%=khbh%>')" value="其它扣款明细">
                  <input type="button" onClick="window.open('/cwgl/sgdjk/Cw_gdjkjlCxList.jsp?crm_khxx_sgd=<%=sgd%>&fgs=<%=fgsbh%>&scbz=N')" value="前期拨款记录">
                  <input type="button" onClick="window.open('/fcgl/cl_ckd/Cl_ckdCxList.jsp?khbh=<%=khbh%>&fgs=<%=fgsbh%>&myxssl=30')" value="材料出库明细" >
                  <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
              </td>
            </tr>
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
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> 
              </td>
              <td align="right"><font color="#0000FF">客户类型</font></td>
              <td> 
                  <%
	cf.selectToken(out,"1+非加活动客户&2+参加活动客户",khlx,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">参加促销活动</font></td>
              <td> <%=cxhdbm%>
              </td>
              <td align="right"><font color="#0000FF">折扣率</font></td>
              <td> <%=zkl%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">工程原报价</font></td>
              <td> <%=wdzgce%>
              </td>
              <td align="right"><font color="#0000FF">工程签约额</font></td>
              <td> <%=qye%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">折前增减项金额</font></td>
              <td> <%=zjxje%>
              </td>
              <td align="right"><font color="#0000FF">折后增减项金额</font></td>
              <td> <%=zhzjxje%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">折前完工造价</font></td>
              <td> <%=zqwgzj%>
              </td>
              <td align="right"><font color="#0000FF">工队完工造价</font></td>
              <td> <%=zhwgzj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">家装实收款总额</font></td>
              <td> <%=khsskze%>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">管理费比率</td>
              <td> <%=glftd%>
                % </td>
              <td align="right"><font color="#0000FF">管理费</font></td>
              <td> <%=glf%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">应付工费</font></td>
              <td colspan="3"> <%=gdjskze%>
                &nbsp;&nbsp;<b>< 应付工费＝工队完工造价×（1-管理费比例） ></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" height="30" align="center"><b><font color="#000099">代扣款项目</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">材料费</td>
              <td width="32%"> <%=clf%>
              </td>
              <td width="18%" align="right">标准材料费比率</td>
              
            <td width="32%"> <%=bzclfbl%>% </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">材料扣款</td>
              <td colspan="3"><%=xbclk%><b> 
               （材料扣款：（领料款-退料款）金额不足18%时的部分做为材料扣款）</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">配送工具工服费</td>
              <td width="32%"> <%=psgjgff%>
              </td>
              <td width="18%" align="right">运输费</td>
              <td width="32%"> <%=ysf%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">扣质保金百分比</td>
              <td width="32%"> <%=wxjbfb%>
                % </td>
              <td width="18%" align="right">扣质保金</td>
              <td width="32%"> <%=wxj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">工程减项扣款</td>
              <td width="32%"> <%=gcjxkk%>
              </td>
              <td width="18%" align="right">税金</td>
              <td width="32%"> <%=sj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">立邦成本</td>
              <td width="32%"> <%=lbcb%>
              </td>
              <td width="18%" align="right">其它扣款</td>
              <td width="32%"> <%=kqtk%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4" height="22"><b><font color="#000099">结算金额</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">前期已拨工费</td>
              <td width="32%"> <%=jkje%>
              </td>
              <td width="18%" align="right">应拨工费</td>
              <td width="32%"> <%=sqgz%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right"><b>应拨工费=</b><font color="#003399">应付工费-材料费+标准材料费比率-材料扣款-配送工具工服费-运输费-扣质保金-工程减项扣款-税金-立邦成本-其它扣款-前期已拨工费</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">工程增项奖励</td>
              <td width="32%"> <%=gczxjl%>
              </td>
              <td width="18%" align="right">远程费拨款</td>
              <td width="32%"> <%=ycfbk%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="25">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">结算类型</font></td>
              <td> 
                  <%
	cf.selectToken(out,"1+完工结算&2+中期结算",jslx,true);
%> 
              </td>
              <td align="right"><font color="#0000FF">结算单位</font></td>
              <td> 
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'",jsdw,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算人</font></div>
              </td>
              <td width="32%"> <%=jsr%>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算时间</font></div>
              </td>
              <td width="32%"> <%=jssj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> <%=bz%>
              </td>
            </tr>
          </table>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
