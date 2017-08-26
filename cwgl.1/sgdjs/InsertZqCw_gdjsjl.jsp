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
<%
String jsdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String khbh=request.getParameter("khbh");
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
String zjxwcbz=null;
double qye=0;
double wdzgce=0;
double hbssk=0;//环保项目实收款

double zjxje=0;
double zhzjxje=0;
double sfke=0;
double zkl=0;
double hdzkl=0;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
double zqwgzj=0;
double zhwgzj=0;
String fgsbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

double gckk=0;

String gdjsjlh=null;
String khlx=null;


double sjclf=0;//材料费
double bzclf=0;
double tlk=0;
double ysf=0;
double psgjgff=0;
double kqtk=0;
double jkje=0;

double gdjskze=0;

double bzclfbl=18;//标准材料费比率
//中期结算的材料费不足合同造价的18％时，按合同造价的18％取材料费，超过18％的取实际的材料费。


try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,cxhdbm,cxhdbmxq,cxhdbmzh,zkl,zjxwcbz,zjxje,zhzjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		zkl=rs.getDouble("zkl");
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
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


	zqwgzj=cf.doubleTrim(wdzgce+zjxje);

	if (zjxwcbz.equals("1"))
	{
//		out.println("错误！增减项未完成，不能结算");
//		return;
	}

	if (jzbz.equals(""))
	{
		jzbz="1";
	}

	if (cxhdbm.equals(""))
	{
		khlx="1";
		zhwgzj=cf.doubleTrim(qye+zhzjxje);
	}
	else{//如果参加活动，取:活动折扣
		khlx="2";

		double yjxs1=10;
		if (!cxhdbm.equals(""))
		{
			ls_sql="select yjxs";
			ls_sql+=" from  jc_cxhdyjxs";
			ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11：施工队活动折扣
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjxs1=rs.getDouble("yjxs");
			}
			else{
				rs.close();
				ps.close();
//				out.println("错误！参加促销活动不存在："+cxhdbm);
//				return;
			}
			rs.close();
			ps.close();
		}

		if (yjxs1<=0 || yjxs1>10)
		{
//			out.println("错误！促销活动成本比例不正确："+yjxs1);
//			return;
		}

		double yjxs2=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql="select yjxs";
			ls_sql+=" from  jc_cxhdyjxs";
			ls_sql+=" where cxhdmc='"+cxhdbmxq+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11：施工队活动折扣
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjxs2=rs.getDouble("yjxs");
			}
			else{
				rs.close();
				ps.close();
				out.println("错误！参加促销活动不存在："+cxhdbmxq);
				return;
			}
			rs.close();
			ps.close();
		}

		if (yjxs2<=0 || yjxs2>10)
		{
			out.println("错误！促销活动成本比例不正确："+yjxs2);
			return;
		}

		double yjxs3=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql="select yjxs";
			ls_sql+=" from  jc_cxhdyjxs";
			ls_sql+=" where cxhdmc='"+cxhdbmzh+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11：施工队活动折扣
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjxs3=rs.getDouble("yjxs");
			}
			else{
				rs.close();
				ps.close();
				out.println("错误！参加促销活动不存在："+cxhdbmzh);
				return;
			}
			rs.close();
			ps.close();
		}

		if (yjxs3<=0 || yjxs3>10)
		{
			out.println("错误！促销活动成本比例不正确："+yjxs3);
			return;
		}

		hdzkl=10-(10-yjxs1)-(10-yjxs2)-(10-yjxs3);

		zhwgzj=cf.doubleTrim((wdzgce+zjxje)*hdzkl/10);
	}

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

	bzclf=bzclfbl*qye/100.0;//合同造价的18％
	if (bzclf<sjclf)//中期结算的材料费不足合同造价的18％时，按合同造价的18％取材料费，超过18％的取实际的材料费
	{
		bzclf=sjclf;
	}

	


	//配送工具工服费,（取：分公司材料单价）
	ls_sql="select sum(cl_ckmx.cksl*cl_ckmx.fgsdj)";
	ls_sql+=" from  cl_ckd,cl_ckmx";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.khbh='"+khbh+"'";
	ls_sql+=" and cl_ckmx.cldlmc='杂项'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psgjgff=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//运输费
	ls_sql="select sum(cl_ckd.yf)";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where cl_ckd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//扣质保金百分比
	double mqzbj=0;
	ls_sql="select zbj";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where  sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mqzbj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	
	//其它扣款
	ls_sql="select sum(kkje)";
	ls_sql+=" from  cw_kqtkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kqtk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//前期已拨工费
	jkje=0;
/*
	ls_sql="select sum(jkje)";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where khbh='"+khbh+"' and gdjsjd='0' and scbz='N'";//0：未结算；1：已结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jkje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
*/
	gdjskze=cf.doubleTrim(sfke*38/100);

/************************************************************************/

	//获取记录号
	ls_sql="select NVL(max(substr(gdjsjlh,8,2)),0)";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gdjsjlh=khbh+cf.addZero(count+1,2);
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
              <td><%=khxm%>（<%=lxfs%>） </td>
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
              <td align="right"><font color="#0000FF">参加公司促销活动</font></td>
              <td colspan="3"> 
                <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="73" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">参加小区促销活动</font></td>
              <td colspan="3">
                <input type="text" name="cxhdbmxq" value="<%=cxhdbmxq%>" size="73" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">参加展会促销活动</font></td>
              <td colspan="3">
                <input type="text" name="cxhdbmzh" value="<%=cxhdbmzh%>" size="73" maxlength="17" readonly>
              </td>
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
              <td align="right"><font color="#0000FF">折扣率</font></td>
              <td> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
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
              <td align="right"><font color="#0000FF">工队完工造价</font></td>
              <td> 
                <input type="text" name="zhwgzj" value="<%=zhwgzj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">家装实收款总额</font></td>
              <td> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#CC0000">*</font><font color="#0000FF">应付工费</font></td>
              <td colspan="3"> 
                <input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="17" readonly>
                &nbsp;&nbsp;<b>应付工费=</b><font color="#003399">实际收款额×38% </font></td>
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
                <input type="text" name="clf" value="<%=bzclf%>" size="20" maxlength="17" >
              </td>
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
              <td width="18%" align="right">立邦成本</td>
              <td width="32%"> 
                <input type="text" name="lbcb" value="" size="20" maxlength="17" onChange="f_jsglf(insertform)">
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
              <td width="18%" align="right"><font color="#CC0000">*</font>前期已拨工费</td>
              <td width="32%"> 
                <input type="text" name="jkje" value="<%=jkje%>" size="20" maxlength="17" readonly>
              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>应拨工费</td>
              <td width="32%"> 
                <input type="text" name="sqgz" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4"><b>应拨工费=</b><font color="#003399">应付工费-材料费+退料款-配送工具工服费-运输费-立邦成本-其它扣款-前期已拨工费</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">结算类型</font></td>
              <td> 
                <select name="jslx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value="2">中期结算</option>
                </select>
              </td>
              <td align="right"><font color="#0000FF">结算单位</font></td>
              <td> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">结算时间</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button" name="kk" onClick="window.open('/cwgl/kqtk/Cw_kqtkjlCxList.jsp?fgs=<%=fgsbh%>&khbh=<%=khbh%>')" value="其它扣款明细">
                  <input type="button" name="bk" onClick="window.open('/cwgl/sgdjk/Cw_gdjkjlCxList.jsp?cw_gdjkjl_khbh=<%=khbh%>&fgs=<%=fgsbh%>&scbz=N')" value="前期拨款记录">
                  <input type="button" name="ck" onClick="window.open('/fcgl/cl_ckd/Cl_ckdCxList.jsp?khbh=<%=khbh%>&fgs=<%=fgsbh%>&myxssl=30')" value="材料出库明细" >
                  <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
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
	//中期结算的材料费不足合同造价的18％时，按合同造价的18％取材料费，超过18％的取实际的材料费
	bzclf=<%=qye%>*FormName.bzclfbl.value/100;
	bzclf=round(bzclf,2);

	if (bzclf< <%=sjclf%> )//中期结算的材料费不足合同造价的18％时，按合同造价的18％取材料费，超过18％的取实际的材料费
	{
		bzclf=<%=sjclf%>;
	}
	
	FormName.clf.value=bzclf;
}

function f_jsglf(FormName)//参数FormName:Form的名称
{
	f_clfbl(FormName);

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

	if(	javaTrim(FormName.gdjskze)=="") {
		alert("请输入[应付工费]！");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "应付工费"))) {
		return false;
	}

	

	//代扣款项目
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("请输入[标准材料费比率]！");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "标准材料费比率"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
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
	//应拨工费=应付工费-材料费-配送工具工服费-运输费   -立邦成本-其它扣款-前期已拨工费
	sqgz=FormName.gdjskze.value-FormName.clf.value-FormName.psgjgff.value-FormName.ysf.value;
	sqgz=sqgz-FormName.lbcb.value-FormName.kqtk.value-FormName.jkje.value;
	sqgz=round(sqgz,2);
	FormName.sqgz.value=sqgz;

}


function f_do(FormName)//参数FormName:Form的名称
{
	f_clfbl(FormName);
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

	if(	javaTrim(FormName.gdjskze)=="") {
		alert("请输入[应付工费]！");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "应付工费"))) {
		return false;
	}

	//代扣款项目
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("请输入[标准材料费比率]！");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "标准材料费比率"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
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

	FormName.action="SaveInsertZqCw_gdjsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
