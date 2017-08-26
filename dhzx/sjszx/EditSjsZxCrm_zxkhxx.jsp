<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String lrr=null;
String dwbh=null;
String zxsj=null;
String lrsj=null;
String zxjg=null;
String sbyybm=null;

String sjs="";
String zxqk="";
String newzxjlh=null;
String bjjb=null;
String lfsj=null;
String ctbz=null;
String ctsj=null;
String lfbz=null;
String jzbz=null;
String xqbm=null;
String louhao=null;
String sfzdzbj=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String ywy=null;
String ssfgs=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;

String xfwdz=null;
String email=null;
String czrkbm=null;
String jtjgbm=null;
String lcbm=null;
String cxbm=null;
String cgbm=null;
String scqxbm=null;
int zxzc=0;
int hqpszc=0;
int jjzczc=0;
int jdzj=0;
String cxhdbm=null;
String fjfwbm=null;
String fwytbm=null;
String qtdh=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;
String ysshbz="";
String ysshsj=null;
String ysshr=null;
String ysshyj=null;
String bjdysq=null;
String tcmc=null;
String bjbbh=null;
String ysy=null;
String zcsfss=null;
String sfyckh=null;

String sfkdybj="";
String printMark="disabled";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sfyckh,sjs,zcsfss,ysy,bjbbh,bjdysq,ysshbz,ysshsj,ysshr,ysshyj,cxgtbz,cxgtsj,csgtbz,csgtsj,cxhdbmxq,cxhdbmzh,qtdh,fwytbm,fjfwbm,cxhdbm,zxjlh,xfwdz,email,czrkbm,jtjgbm,lcbm,cxbm,cgbm,scqxbm,zxzc,hqpszc,jjzczc,jdzj,nlqjbm,zybm,fj,yjzxsj,ywy,ssfgs,rddqbm,hxwzbm,ysrbm  ,sfzdzbj,louhao,xqbm,jzbz,lfsj,ctsj,lfbz,ctbz,bjjb,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr";
	ls_sql+=" ,crm_zxkhxx.tcmc";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyckh=cf.fillNull(rs.getString("sfyckh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zcsfss=cf.fillNull(rs.getString("zcsfss"));
		ysy=cf.fillNull(rs.getString("ysy"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));

		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		fwytbm=cf.fillNull(rs.getString("fwytbm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		newzxjlh=cf.fillNull(rs.getString("zxjlh"));
		xfwdz=cf.fillNull(rs.getString("xfwdz"));
		email=cf.fillNull(rs.getString("email"));
		czrkbm=cf.fillNull(rs.getString("czrkbm"));
		jtjgbm=cf.fillNull(rs.getString("jtjgbm"));
		lcbm=cf.fillNull(rs.getString("lcbm"));
		cxbm=cf.fillNull(rs.getString("cxbm"));
		cgbm=cf.fillNull(rs.getString("cgbm"));
		scqxbm=cf.fillNull(rs.getString("scqxbm"));
		zxzc=rs.getInt("zxzc");
		hqpszc=rs.getInt("hqpszc");
		jjzczc=rs.getInt("jjzczc");
		jdzj=rs.getInt("jdzj");

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		ywy=cf.fillNull(rs.getString("ywy"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));

		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		louhao=cf.fillNull(rs.getString("louhao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		lfsj=cf.fillNull(rs.getDate("lfsj"));
		ctsj=cf.fillNull(rs.getDate("ctsj"));
		lfbz=rs.getString("lfbz");
		ctbz=rs.getString("ctbz");
		bjjb=rs.getString("bjjb");

		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
	}
	rs.close();
	ps.close();

	ls_sql="select zxsj,lrr,lrsj,zxqk";
	ls_sql+=" from  crm_sjszxqk";
	ls_sql+=" where zxjlh='"+newzxjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lrr=rs.getString("lrr");
		zxqk=rs.getString("zxqk");
		zxsj=cf.fillNull(rs.getDate("zxsj"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	if (!bjdysq.equals("1"))
	{
		bjdysq="disabled";
	}
	else{
		bjdysq="";
	}

	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//是否可打印报价:Y：是；N：否
	}
	rs.close();
	ps.close();

	sfkdybj="Y";

	if (sfkdybj.equals("Y"))
	{
		printMark="";
	}

	if (ysshbz.equals("B"))//N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过
	{
		out.println("错误！已申请审核，不能再修改报价");
		return;
	}
	else if (ysshbz.equals("C"))
	{
		out.println("错误！已受理申请，不能再修改报价");
		return;
	}
	else if (ysshbz.equals("Y"))
	{
		out.println("错误！已审核通过，不能再修改报价");
		return;
	}


	if (!bjbbh.equals(""))
	{
		String sfzybb="";
		ls_sql="select sfzybb";
		ls_sql+=" from  bj_dzbjbb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfzybb=rs.getString (1);
		}
		else{
			out.println("错误！版本不存在："+bjbbh);
			return;
		}
		rs.close();
		ps.close();

		if (sfzybb.equals("4"))//1：未启用；2：当前版；3：可用版；4：已停用
		{
			String getbjbbh="";
			ls_sql="select bjbbh";
			ls_sql+=" from  crm_bjbbsqjl";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getbjbbh=rs.getString (1);
			}
			rs.close();
			ps.close();

			if (!getbjbbh.equals(bjbbh))
			{
				out.println("错误！版本已停用，若想继续使用请申请授权");
				return;
			}
		}
	}
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>设计师咨询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4"><b><font color="#000066">设计师咨询情况（咨询记录号：<%=newzxjlh%>）</font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4" height="25">基本信息</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000FF">客户姓名</font></div>              </td>
              <td width="32%"> 
              <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" readonly>              </td>
              <td width="18%"> 
              <div align="right"><font color="#CC0000">*</font>性别</div>              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">手机</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" size="40" maxlength="50"  value="<%=lxfs%>" readonly>
                <font color="#FF0000">用于接收短信，最好录一部,有多个电话<font color="#0000FF">用英文逗号</font>分隔</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#0000FF">其它电话</font></td>
              <td colspan="3"> 
                <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50" readonly>
                <font color="#FF0000">(注意：有多个电话<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">电子邮件</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                <font color="#FF0000">(注意：有多个邮箱<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>年龄区间</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
                </select>              </td>
              <td width="18%" align="right">职业</td>
              <td width="32%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>常住人口</td>
              <td width="32%"> 
                <select name="czrkbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czrkbm,czrkmc from dm_czrkbm order by czrkbm",czrkbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>家庭结构</td>
              <td width="32%"> 
                <select name="jtjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jtjgbm,jtjgmc from dm_jtjgbm order by jtjgbm",jtjgbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" height="28">现住地址</td>
              <td colspan="3" height="28"> 
                <input type="text" name="xfwdz" size="73" maxlength="100"  value="<%=xfwdz%>">              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">装修房屋所属城区</font></td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(editform)">
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"' order by cqbm",cqbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">装修房屋小区/街道</font></td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(editform)" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" height="2"><font color="#CC0000">*</font><font color="#0000FF">装修房屋楼号/门牌号</font></td>
              <td width="32%" height="2"> 
              <input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(editform)" readonly>              </td>
              <td colspan="2" height="2">注意：<font color="#0000FF">装修房屋地址</font>（城区＋小区＋楼号）自动生成，不需录入</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000FF">装修房屋地址</font></div>              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">参加公司促销活动</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbm%>
              <input name="button3" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')"  value="调整活动">
              <input name="button4" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khzsxx.jsp?khbh=<%=khbh%>')"  value="活动赠送信息">
              <input name="button22" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="调整代金券"></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">参加小区促销活动</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">参加展会促销活动</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmzh%></td>
            </tr>
            <tr bgcolor="#E8E8D4" align="center"> 
              <td colspan="4" height="26">房屋及个人取向情况</td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>房屋类型</div>              </td>
              <td width="32%"> 
                <select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm);
%> 
                </select>              </td>
              <td width="18%"> 
              <div align="right"><font color="#CC0000">*</font>预计装修时间</div>              </td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>户型</td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>套内建筑面积</td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>楼层</td>
              <td width="32%"> 
                <select name="lcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select lcbm,lcmc from dm_lcbm order by lcbm",lcbm);
%> 
                </select>              </td>
              <td width="18%" align="right">房价</td>
              <td width="32%"> 
                <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>朝向</td>
              <td width="32%"> 
                <select name="cxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxbm,cxmc from dm_cxbm order by cxbm",cxbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>采光</td>
              <td width="32%"> 
                <select name="cgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from dm_cgbm order by cgbm",cgbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>准备装修风格</div>              </td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
                </select>              </td>
              <td width="18%"> 
              <div align="right"><font color="#CC0000">*</font>色彩取向</div>              </td>
              <td width="32%"> 
                <select name="scqxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select scqxbm,scqxmc from dm_scqxbm order by scqxbm",scqxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>房屋用途</td>
              <td width="32%"> 
                <select name="fwytbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwytbm,fwytmc from dm_fwytbm order by fwytbm",fwytbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>是否远程客户</td>
              <td width="32%"><%
	cf.radioToken(out, "sfyckh","Y+是&N+否",sfyckh);
%></td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4" height="29">家居理财专业建议</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>装修总预算</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm);
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">套餐名称</td>
              <td width="32%"><%=tcmc%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">装修支出</td>
              <td width="32%"> 
              <input type="text" name="zxzc" size="20" maxlength="16" value="<%=zxzc%>">              </td>
              <td width="18%" align="right">后期配饰支出</td>
              <td width="32%"> 
                <input type="text" name="hqpszc" size="20" maxlength="16" value="<%=hqpszc%>">              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">家居主材支出</td>
              <td width="32%"> 
              <input type="text" name="jjzczc" size="20" maxlength="16" value="<%=jjzczc%>">              </td>
              <td width="18%" align="right">机动资金</td>
              <td width="32%"> 
                <input type="text" name="jdzj" size="20" maxlength="16" value="<%=jdzj%>">              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4" height="29">设计师咨询情况</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">预算员</td>
              <td><select name="ysy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
					cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('20') and sq_yhxx.sfzszg in('Y','N') order by yhmc",ysy);
				%>
              </select></td>
              <td align="right">设计师</td>
              <td><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">预算审核</td>
              <td><%
	cf.selectToken(out,"N+未审核&Y+审核通过&M+审核未通过",ysshbz,true);
%></td>
              <td align="right"><font color="#CC0000">*</font>报价版本号</td>
              <td><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' and bj_dzbjbb.bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh",bjbbh);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">预算审核人</td>
              <td><%=ysshr%></td>
              <td align="right">预算审核时间</td>
              <td><%=ysshsj%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">预算审核意见</td>
              <td colspan="3"><%=ysshyj%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>报价级别</td>
              <td width="32%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:120PX">
                  <%
	if (bjjb!=null && !bjjb.equals(""))
	{
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjb+"'",bjjb);
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm",bjjb);
	}
%> 
                </select>              </td>
              <td width="18%" align="right">家装标志</td>
              <td width="32%"> <%
		if (sfzdzbj.equals("Y"))
		{
			cf.radioToken(out, "jzbz","1+家装报价&2+公装报价",jzbz,true);
		}
		else{
			cf.radioToken(out, "jzbz","1+家装报价&2+公装报价",jzbz);
		}
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>量房标志</td>
              <td width="32%"><%
		cf.radioToken(out, "lfbz","N+未量房&Y+已量房",lfbz);
%></td>
              <td width="18%" align="right">量房时间</td>
              <td width="32%"> 
                <input type="text" name="lfsj" size="20" maxlength="20"  value="<%=lfsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>出平面图标志</td>
              <td width="32%"> <%
		cf.radioToken(out, "ctbz","N+未出图&Y+已出图",ctbz);
%> </td>
              <td width="18%" align="right">出平面图时间</td>
              <td width="32%"> 
                <input type="text" name="ctsj" size="20" maxlength="20"  value="<%=ctsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#CC0000">*</font>出效果图标志</td>
              <td><%
		cf.radioToken(out, "cxgtbz","N+未出图&Y+已出图",cxgtbz);
%></td>
              <td align="right">出效果图时间</td>
              <td><input type="text" name="cxgtsj" size="20" maxlength="20"  value="<%=cxgtsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#CC0000">*</font>出施工图标志</td>
              <td><%
		cf.radioToken(out, "csgtbz","N+未出图&Y+已出图",csgtbz);
%></td>
              <td align="right">出施工图时间</td>
              <td><input type="text" name="csgtsj" size="20" maxlength="20"  value="<%=csgtsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">咨询情况</td>
              <td colspan="3"> 
                <textarea name="zxqk" cols="72" rows="4"><%=zxqk%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                    <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                    <input type="hidden" name="zcsfss"  value="<%=zcsfss%>" >
                    <input type="hidden" name="zxjlh"  value="<%=newzxjlh%>" >
                    <input type="hidden" name="dwbh"  value="<%=zxdm%>" >
                    <input type="hidden" name="sjs" value="<%=sjs%>" readonly>
                    <input type="hidden" name="zxsj" value="<%=cf.today()%>" >
                    <input type="hidden" name="lrr" value="<%=lrr%>" readonly>
                    <input type="hidden" name="lrsj" value="<%=cf.today()%>" readonly>

                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="button"  value="选房间" onClick="f_lrfj(editform)" >
                    <input type="button"  value="修改房间" onClick="f_xgfj(editform)">
                    <input type="button" onClick="f_xzxm(editform)"  value="选报价项目">
                    <input type="button" onClick="f_fjxmpx(editform)"  value="调项目顺序" >
                    <input type="button" onClick="f_ewlr(editform)"  value="选其它收费">
                    <input type="button" onClick="f_ewck(editform)"  value="修改其它收费">
                    <p>
                    <input type="button" onClick="f_drmb(editform)"  value="导入报价" >
                    <input type="button" onClick="f_bcmb(editform)"  value="报价另存为" >
                    <input type="button" onClick="f_excel(editform)"  value="导出报价" <%=bjdysq%>>
                    <input type="button" onClick="f_tbjjb(editform)"  value="调报价级别" >
                    <input name="button" type="button" onClick="f_tzk(editform)"  value="调折扣" >
                    <input type="button" onClick="f_dybj(editform)"  value="打印报价"  <%=printMark%>>
                    <input type="button" onClick="window.open('/zlkxt/loadWj.jsp?khbh=<%=khbh%>&khxm=<%=khxm%>')"  value="图纸上传">
                    <input name="button2" type="button" onClick="window.open('/dhzx/yssh/InsertBj_ysshjl.jsp?khbh=<%=khbh%>')"  value="预算审核">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function cf_fwdz(FormName)
{  
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
	//基本信息
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}
	if(	javaTrim(FormName.nlqjbm)=="") {
		alert("请输入[年龄区间]！");
		FormName.nlqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.czrkbm)=="") {
		alert("请输入[常住人口]！");
		FormName.czrkbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jtjgbm)=="") {
		alert("请输入[家庭结构]！");
		FormName.jtjgbm.focus();
		return false;
	}



	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("请输入[楼号/门牌号]！");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}


	//房屋及个人取向情况
	if(	javaTrim(FormName.fwlxbm)=="") {
		alert("请输入[房屋类型]！");
		FormName.fwlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjzxsj)=="") {
		alert("请输入[预计装修时间]！");
		FormName.yjzxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[套内建筑面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "套内建筑面积"))) {
		return false;
	}
	if (FormName.fwmj.value=="0")
	{
		alert("[套内建筑面积]不能为0！");
		FormName.fwmj.select();
		return false;
	}


	if(	javaTrim(FormName.lcbm)=="") {
		alert("请输入[楼层]！");
		FormName.lcbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cxbm)=="") {
		alert("请输入[朝向]！");
		FormName.cxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cgbm)=="") {
		alert("请输入[采光]！");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgyqbm)=="") {
		alert("请输入[准备装修风格]！");
		FormName.fgyqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.scqxbm)=="") {
		alert("请输入[色彩取向]！");
		FormName.scqxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwytbm)=="") {
		alert("请输入[房屋用途]！");
		FormName.fwytbm.focus();
		return false;
	}


	//家居理财专业建议
	if(	javaTrim(FormName.zxysbm)=="") {
		alert("请输入[装修总预算]！");
		FormName.zxysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.zxzc, "装修支出"))) {
		return false;
	}
	if(!(isNumber(FormName.hqpszc, "后期配饰支出"))) {
		return false;
	}
	if(!(isNumber(FormName.jjzczc, "家居主材支出"))) {
		return false;
	}
	if(!(isNumber(FormName.jdzj, "机动资金"))) {
		return false;
	}

	if(	javaTrim(FormName.bjjb)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjb.focus();
		return false;
	}
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请输入[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}


	//设计师咨询情况
	if ("<%=sfzdzbj%>"=="Y")
	{
		if(!FormName.jzbz.checked) {
			alert("请选择[家装标志]！");
			FormName.jzbz.focus();
			return false;
		}
	}
	else
	{
		if(	!radioChecked(FormName.jzbz)) {
			alert("请选择[家装标志]！");
			FormName.jzbz[0].focus();
			return false;
		}
	}
	
	if(	!radioChecked(FormName.lfbz)) {
		alert("请选择[量房标志]！");
		FormName.lfbz[0].focus();
		return false;
	}
	if (FormName.lfbz[1].checked)
	{
		if(	javaTrim(FormName.lfsj)=="") {
			alert("请输入[量房时间]！");
			FormName.lfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.lfsj, "量房时间"))) {
			return false;
		}
	}
	else{
		FormName.lfsj.value="";
	}

	if(	!radioChecked(FormName.ctbz)) {
		alert("请选择[出平面图标志]！");
		FormName.ctbz[0].focus();
		return false;
	}
	if (FormName.ctbz[1].checked)
	{
		if(	javaTrim(FormName.ctsj)=="") {
			alert("请输入[出平面图时间]！");
			FormName.ctsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.ctsj, "出平面图时间"))) {
			return false;
		}
	}
	else{
		FormName.ctsj.value="";
	}
	if(	!radioChecked(FormName.cxgtbz)) {
		alert("请选择[出效果图标志]！");
		FormName.cxgtbz[0].focus();
		return false;
	}
	if (FormName.cxgtbz[1].checked)
	{
		if(	javaTrim(FormName.cxgtsj)=="") {
			alert("请输入[出效果图时间]！");
			FormName.cxgtsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxgtsj, "出效果图时间"))) {
			return false;
		}
	}
	else{
		FormName.cxgtsj.value="";
	}
	if(	!radioChecked(FormName.csgtbz)) {
		alert("请选择[出施工图标志]！");
		FormName.csgtbz[0].focus();
		return false;
	}
	if (FormName.csgtbz[1].checked)
	{
		if(	javaTrim(FormName.csgtsj)=="") {
			alert("请输入[出施工图时间]！");
			FormName.csgtsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.csgtsj, "出施工图时间"))) {
			return false;
		}
	}
	else{
		FormName.csgtsj.value="";
	}



	//隐藏信息
	if(	javaTrim(FormName.zxsj)=="") {
		alert("请输入[咨询时间]！");
		FormName.zxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zxsj, "咨询时间"))) {
		return false;
	}

/*	
	if(	!radioChecked(FormName.zcsfss)) {
		alert("请输入[主材是否收税]！");
		FormName.zcsfss[0].focus();
		return false;
	}
*/
	if(	!radioChecked(FormName.sfyckh)) {
		alert("请选择[是否远程客户 ]！");
		FormName.sfyckh[0].focus();
		return false;
	}


	FormName.action="SaveEditSjsZxCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_bcmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/cwmb.jsp";
	FormName.submit();
	return true;
}
function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/ChooseBj_fjxx.jsp";
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/EditBj_fjxx.jsp";
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}
function f_ewck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/Bj_sfxmmxList.jsp";
	FormName.submit();
	return true;
}

function f_xzxm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_excel(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_dybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}


	FormName.action="dybj.jsp?dqbm=<%=dqbm%>";

	FormName.submit();
	return true;
}

function f_drmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.bjjb)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjb.focus();
		return false;
	}



	FormName.action="/dzbjone/zxbjmx/drmb.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_edit(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="EditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_tbjjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/EditAllBjjb.jsp";

	FormName.submit();
	return true;
}

function f_xmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}

function f_fjxmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzFjXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}
function f_xmdj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzDjBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}

function f_dxzk(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	window.open("/dzbjone/zxbjmx/Bj_sfxmmxZklList.jsp?khbh=<%=khbh%>");
}

function f_zjsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/zjtccl.jsp";
	FormName.submit();
	return true;
}

function f_tzk(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dhzx/tzzk/index.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
