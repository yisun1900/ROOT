<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String bianhao=null;
String yhmc=null;
String xb=null;
String csrq=null;
String sfzszg=null;
String mz=null;
String sg=null;
String tz=null;
String xx=null;
String hf=null;
String zzmm=null;
String sjsjb=null;
String zcmc=null;
String zyzzzs=null;
String xlbm=null;
String zy=null;
String cjgzsj=null;
String xuewei=null;
String byyx=null;
String zz=null;
String yzbm=null;
String dh=null;
String bgdh=null;
String jtdh=null;
String email=null;
String sfzh=null;
String sfzdz=null;
String gznx=null;
String jjlxr=null;
String jjlxrdz=null;
String lxrdh=null;
String zwbm=null;
String xzzwbm=null;
String sfytj=null;
String tjrq=null;
String sfqs=null;
String dhsfgb=null;
String zwpj=null;
String ssfgs=null;
String dwbh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sfydbs=null;
String qgzdw=null;
String wgzsj=null;
String syjzrq=null;
String kqhm=null;
String hjszd=null;
String dacfd=null;
String dazrsj=null;
String dazcsj=null;
String dazchc=null;
String dabgfjs=null;
String sjsbh=null;
String rzcs=null;
String rzsj=null;
String gqpxkssj=null;
String gqpxjssj=null;
String xuhao=null;

String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	
	ls_sql="select xuhao,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx,hf,zzmm,sjsjb,zcmc,zyzzzs,xlbm,zy,cjgzsj,xuewei,byyx,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr,jjlxrdz,lxrdh,zwbm,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,ssfgs,dwbh,lrr,lrsj,bz,sfydbs,qgzdw,wgzsj,syjzrq,kqhm,hjszd,dacfd,dazrsj,dazcsj,dazchc,dabgfjs,sjsbh,rzcs,rzsj,gqpxkssj,gqpxjssj ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));

		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		sfzszg=cf.fillNull(rs.getString("sfzszg"));
		mz=cf.fillNull(rs.getString("mz"));
		sg=cf.fillNull(rs.getString("sg"));
		tz=cf.fillNull(rs.getString("tz"));
		xx=cf.fillNull(rs.getString("xx"));
		hf=cf.fillNull(rs.getString("hf"));
		zzmm=cf.fillNull(rs.getString("zzmm"));
		sjsjb=cf.fillNull(rs.getString("sjsjb"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zyzzzs=cf.fillNull(rs.getString("zyzzzs"));
		xlbm=cf.fillNull(rs.getString("xlbm"));
		zy=cf.fillNull(rs.getString("zy"));
		cjgzsj=cf.fillNull(rs.getDate("cjgzsj"));
		xuewei=cf.fillNull(rs.getString("xuewei"));
		byyx=cf.fillNull(rs.getString("byyx"));
		zz=cf.fillNull(rs.getString("zz"));
		yzbm=cf.fillNull(rs.getString("yzbm"));
		dh=cf.fillNull(rs.getString("dh"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		jtdh=cf.fillNull(rs.getString("jtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		sfzdz=cf.fillNull(rs.getString("sfzdz"));
		gznx=cf.fillNull(rs.getString("gznx"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		jjlxrdz=cf.fillNull(rs.getString("jjlxrdz"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		sfytj=cf.fillNull(rs.getString("sfytj"));
		tjrq=cf.fillNull(rs.getDate("tjrq"));
		sfqs=cf.fillNull(rs.getString("sfqs"));
		dhsfgb=cf.fillNull(rs.getString("dhsfgb"));
		zwpj=cf.fillNull(rs.getString("zwpj"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sfydbs=cf.fillNull(rs.getString("sfydbs"));
		qgzdw=cf.fillNull(rs.getString("qgzdw"));
		wgzsj=cf.fillNull(rs.getString("wgzsj"));
		syjzrq=cf.fillNull(rs.getDate("syjzrq"));
		kqhm=cf.fillNull(rs.getString("kqhm"));
		hjszd=cf.fillNull(rs.getString("hjszd"));
		dacfd=cf.fillNull(rs.getString("dacfd"));
		dazrsj=cf.fillNull(rs.getDate("dazrsj"));
		dazcsj=cf.fillNull(rs.getDate("dazcsj"));
		dazchc=cf.fillNull(rs.getString("dazchc"));
		dabgfjs=cf.fillNull(rs.getString("dabgfjs"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		rzcs=cf.fillNull(rs.getString("rzcs"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		gqpxkssj=cf.fillNull(rs.getDate("gqpxkssj"));
		gqpxjssj=cf.fillNull(rs.getDate("gqpxjssj"));
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
<title>修改员工登记表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSq_yhxx.jsp" name="editform" target="_blank">
<div align="center">修改员工登记表</div>
<div align="center">
  <input type="button" value="录入教育经历" onClick="window.open('InsertRs_jyjl.jsp?ygbh=<%=whereygbh%>')">
  <input type="button" value="录入工作经历" onClick="window.open('InsertRs_gzjl.jsp?ygbh=<%=whereygbh%>')">
  <input type="button" value="录入家庭资料" onClick="window.open('InsertRs_jtzl.jsp?ygbh=<%=whereygbh%>')">
    <input type="button"  value="上传照片" onClick="window.open('loadPhoto.jsp?ygbh=<%=whereygbh%>')">
    <input type="button"  value="查看照片" onClick="window.open('viewPhoto.jsp?ygbh=<%=whereygbh%>')">
    <input name="button2" type="button" onClick="f_do(editform)"  value="保存">
    <input name="reset2" type="reset"  value="重输">
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><font color=#0000ff>姓名</font></td>
      <td width="15%"> 
        <input type="text" name="yhmc" size="15" maxlength="50"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>性别</td>
      <td width="15%"> 
        <select name="xb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"M+男&W+女",xb);
%> 
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>出生日期</td>
      <td width="15%"> 
        <input type="text" name="csrq" size="15" maxlength="10"  value="<%=csrq%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>员工状态 </td>
      <td width="15%"> 
        <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退",sfzszg);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">民族</td>
      <td width="15%"> 
        <input type="text" name="mz" size="15" maxlength="20"  value="<%=mz%>" >      </td>
      <td align="right" width="15%">身高(cm)</td>
      <td width="15%"> 
        <input type="text" name="sg" size="15" maxlength="8"  value="<%=sg%>" >      </td>
      <td align="right" width="15%">体重(KG)</td>
      <td width="15%"> 
        <input type="text" name="tz" size="15" maxlength="8"  value="<%=tz%>" >      </td>
      <td align="right" width="10%">血型</td>
      <td width="15%"> 
        <select name="xx" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+A型&2+B型&3+AB型&4+O型",xx);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">婚姻状况</td>
      <td width="15%"> 
        <select name="hf" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"Y+是&N+否",hf);
%> 
        </select>      </td>
      <td align="right" width="15%">政治面貌</td>
      <td width="15%"> 
        <select name="zzmm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"0+群众&1+中共党员&2+共青团员&3+民主党派",zzmm);
%> 
        </select>      </td>
      <td align="right" width="15%">技术职称</td>
      <td width="15%"> 
        <select name="zcmc" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc);
%> 
        </select>      </td>
      <td align="right" width="10%">主要资质证书</td>
      <td width="15%"> 
        <select name="zyzzzs" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>文化程度</td>
      <td width="15%"> 
        <select name="xlbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm",xlbm);
%> 
        </select>      </td>
      <td align="right" width="15%">所学专业</td>
      <td width="15%"> 
        <input type="text" name="zy" size="15" maxlength="50"  value="<%=zy%>" >      </td>
      <td align="right" width="15%">毕业时间</td>
      <td width="15%"> 
        <input type="text" name="cjgzsj" size="15" maxlength="10"  value="<%=cjgzsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">学位</td>
      <td width="15%"> 
        <select name="xuewei" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+学士学位&2+硕士学位&3+博士学位",xuewei);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">毕业院校</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="byyx" size="50" maxlength="50"  value="<%=byyx%>" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>是否已体检</td>
      <td width="15%"><%
	cf.radioToken(out, "sfytj","Y+是&N+否",sfytj);
%></td>
      <td align="right" width="10%">体检日期</td>
      <td width="15%"> 
        <input type="text" name="tjrq" size="15" maxlength="10"  value="<%=tjrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">现详细住址</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="zz" size="50" maxlength="200"  value="<%=zz%>" >      </td>
      <td align="right" width="15%">邮政编码</td>
      <td width="15%"> 
        <input type="text" name="yzbm" size="15" maxlength="10"  value="<%=yzbm%>" >      </td>
      <td align="right" width="10%">email</td>
      <td width="15%"> 
        <input type="text" name="email" size="15" maxlength="50"  value="<%=email%>" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">手机</td>
      <td width="15%"> 
        <input type="text" name="dh" size="15" maxlength="50"  value="<%=dh%>" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>办公电话</td>
      <td width="15%"> 
        <input type="text" name="bgdh" size="15" maxlength="50"  value="<%=bgdh%>" >      </td>
      <td align="right" width="15%">家庭电话</td>
      <td width="15%"> 
        <input type="text" name="jtdh" size="15" maxlength="50"  value="<%=jtdh%>" >      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>电话是否公布</td>
      <td width="15%"> 
        <select name="dhsfgb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <%
	cf.selectToken(out,"1+本公司&2+不限制&9+不公布",dhsfgb);
	%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>身份证号</td>
      <td width="15%"> 
        <input type="text" name="sfzh" size="15" maxlength="18"  value="<%=sfzh%>" >      </td>
      <td align="right" width="15%">身份证地址</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="sfzdz" size="50" maxlength="100"  value="<%=sfzdz%>" >      </td>
      <td align="right" width="10%">工号</td>
      <td width="15%"> 
        <input type="text" name="bianhao" size="15" maxlength="20"  value="<%=bianhao%>" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">紧急联系人</td>
      <td width="15%"> 
        <input type="text" name="jjlxr" size="15" maxlength="20"  value="<%=jjlxr%>" >      </td>
      <td align="right" width="15%">紧急联系人住址</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="jjlxrdz" size="50" maxlength="100"  value="<%=jjlxrdz%>" >      </td>
      <td align="right" width="10%">紧急联系人电话</td>
      <td width="15%"> 
        <input type="text" name="lxrdh" size="15" maxlength="50"  value="<%=lxrdh%>" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">是否裙带关系</td>
      <td width="15%"><%
	cf.radioToken(out, "sfqs","Y+是&N+否",sfqs);
%> </td>
      <td align="right" width="15%">序号</td>
      <td width="15%"><input name="xuhao" type="text" value="<%=xuhao%>" size="15" maxlength="8" ></td>
      <td align="right" width="15%">考勤号码</td>
      <td width="15%"> 
        <input type="text" name="kqhm" size="15" maxlength="8"  value="<%=kqhm%>" >      </td>
      <td align="right" width="10%">设计师职称</td>
      <td width="15%"> 
        <select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%" bgcolor="#E0F5FF">业务专长<BR>
        自我评价</td>
      <td colspan="7"> 
        <textarea name="zwpj" cols="118" rows="3"><%=zwpj%></textarea>      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8"><b>*档案办理情况*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>户籍所在地</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="hjszd" size="50" maxlength="100"  value="<%=hjszd%>" >      </td>
      <td align="right" width="15%">档案存放地</td>
      <td colspan="3"> 
        <input type="text" name="dacfd" size="50" maxlength="50"  value="<%=dacfd%>" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">档案转入时间</td>
      <td width="15%"> 
        <input type="text" name="dazrsj" size="15" maxlength="10"  value="<%=dazrsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">档案转出时间</td>
      <td width="15%"> 
        <input type="text" name="dazcsj" size="15" maxlength="10"  value="<%=dazcsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">档案转出何处</td>
      <td width="15%"> 
        <input type="text" name="dazchc" size="15" maxlength="50"  value="<%=dazchc%>">      </td>
      <td align="right" width="10%">档案保管费结算</td>
      <td width="15%"><%
	cf.radioToken(out, "dabgfjs","N+未结算&Y+结算",dabgfjs);
%></td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8"><b>*入职*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>所属公司</td>
      <td width="15%">
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:114PX" onChange="changeFgs(editform)">
<%
	if (kfgssq.equals("2"))//2：授权多个分公司
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
        </select></td>
      <td align="right" width="15%"><span class="STYLE1">*</span>所属部门</td>
      <td width="15%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:114PX" onChange="changeDwbh(editform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",dwbh);
%> 
        </select>      </td>
      <td align="right" width="15%">所属部门小组</td>
      <td width="15%"> 
        <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:114PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx in('F3','F4') and  cxbz='N'",sjsbh);
		%> 
        </select>      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>行政职务</td>
      <td width="15%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xzzwbm);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>入职日期</td>
      <td width="15%"> 
        <input type="text" name="rzsj" size="15" maxlength="10"  value="<%=rzsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>入职次数</td>
      <td width="15%"> 
        <input type="text" name="rzcs" size="15" maxlength="8"  value="<%=rzcs%>" >      </td>
      <td align="right" width="15%">试用截至日期</td>
      <td width="15%"> 
        <input type="text" name="syjzrq" size="15" maxlength="10"  value="<%=syjzrq%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">工作年限</td>
      <td width="15%"> 
        <input type="text" name="gznx" size="12" maxlength="8"  value="<%=gznx%>" >
        年 </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">未工作时间</td>
      <td width="15%"> 
        <input type="text" name="wgzsj" size="12" maxlength="9"  value="<%=wgzsj%>" >
        年 </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>是否有担保书</td>
      <td width="15%"><%
	cf.radioToken(out, "sfydbs","Y+是&N+否",sfydbs);
%></td>
      <td align="right" width="15%">岗前培训 从</td>
      <td width="15%"> 
        <input type="text" name="gqpxkssj" size="15" maxlength="10"  value="<%=gqpxkssj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">岗前培训 到</td>
      <td width="15%"> 
        <input type="text" name="gqpxjssj" size="15" maxlength="10"  value="<%=gqpxjssj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">前工作单位</td>
      <td colspan="7"> 
        <input type="text" name="qgzdw" size="120" maxlength="100"  value="<%=qgzdw%>" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8">&nbsp;</td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
      <td width="15%"><input type="text" name="lrr" size="15" maxlength="20"  value="<%=lrr%>" readonly></td>
      <td align="right" width="15%"><span class="STYLE2"><span class="STYLE1">*</span>录入时间</span></td>
      <td width="15%"><input type="text" name="lrsj" size="15" maxlength="10"  value="<%=lrsj%>" readonly></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="15%">&nbsp;</td>
      <td align="right" width="10%">&nbsp;</td>
      <td width="15%">&nbsp;</td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">备注</td>
      <td colspan="7"><b>
        <textarea name="bz" cols="119" rows="2"><%=bz%></textarea>
      </b> </td>
    </tr>
    
    
    <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
    <tr> 
      <td colspan="8" height="2"> 
        <div align="center"> 
          <input type="button" value="录入教育经历" onClick="window.open('InsertRs_jyjl.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button" value="录入工作经历" onClick="window.open('InsertRs_gzjl.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button" value="录入家庭资料" onClick="window.open('InsertRs_jtzl.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button"  value="上传照片" onClick="window.open('loadPhoto.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button"  value="查看照片" onClick="window.open('viewPhoto.jsp?ygbh=<%=whereygbh%>')" >
          <input name="button" type="button" onClick="f_do(editform)"  value="保存">
          <input name="reset" type="reset"  value="重输">
        </div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	czlx=1;

	FormName.dwbh.length=1;
	FormName.sjsbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	czlx=2;

	FormName.sjsbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F3','F4') and  cxbz='N' and ssdw='"+FormName.dwbh.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(editform.dwbh,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(editform.sjsbh,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("请选择[性别]！");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.csrq)=="") {
		alert("请输入[出生日期]！");
		FormName.csrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	if(	javaTrim(FormName.sfzszg)=="") {
		alert("请选择[员工状态 ]！");
		FormName.sfzszg.focus();
		return false;
	}
	if(!(isNumber(FormName.sg, "身高(cm)"))) {
		return false;
	}
	if(!(isNumber(FormName.tz, "体重(KG)"))) {
		return false;
	}
	if(!(isDatetime(FormName.cjgzsj, "毕业时间"))) {
		return false;
	}
//	if(	javaTrim(FormName.dh)=="") {
//		alert("请输入[手机]！");
//		FormName.dh.focus();
//		return false;
//	}
	if(	javaTrim(FormName.bgdh)=="") {
		alert("请输入[办公电话]！");
		FormName.bgdh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("请输入[身份证号]！");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[身份证]错误！只能是15位或18位");
		FormName.sfzh.focus();
		return false;
	}
//	if(	javaTrim(FormName.jjlxr)=="") {
//		alert("请输入[紧急联系人]！");
//		FormName.jjlxr.focus();
//		return false;
//	}
//	if(	javaTrim(FormName.lxrdh)=="") {
//		alert("请输入[紧急联系人电话]！");
//		FormName.lxrdh.focus();
//		return false;
//	}
	if(	!radioChecked(FormName.sfytj)) {
		alert("请选择[是否已体检]！");
		FormName.sfytj[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq, "体检日期"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfqs)) {
		alert("请选择[是否与公司其他人有亲属关系]！");
		FormName.sfqs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dhsfgb)=="") {
		alert("请输入[电话是否公布]！");
		FormName.dhsfgb.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[所属部门]！");
		FormName.dwbh.focus();
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
	if(	!radioChecked(FormName.sfydbs)) {
		alert("请选择[是否有担保书]！");
		FormName.sfydbs[0].focus();
		return false;
	}
//	if(	javaTrim(FormName.wgzsj)=="") {
//		alert("请输入[未工作时间(年)]！");
//		FormName.wgzsj.focus();
//		return false;
//	}
	if(!(isFloat(FormName.wgzsj, "未工作时间(年)"))) {
		return false;
	}

	if (FormName.sfzszg.value=="N")
	{
		if(	javaTrim(FormName.syjzrq)=="") {
			alert("请输入[试用截至日期]！");
			FormName.syjzrq.focus();
			return false;
		}

		if(!(isDatetime(FormName.syjzrq, "试用截至日期"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.syjzrq)!="") {
			alert("非试用员工，不能录入[试用截至日期]！");
			FormName.syjzrq.select();
			return false;
		}
	}

	if(	javaTrim(FormName.hjszd)=="") {
		alert("请输入[户籍所在地]！");
		FormName.hjszd.focus();
		return false;
	}
//	if(	javaTrim(FormName.dacfd)=="") {
//		alert("请输入[档案存放地]！");
//		FormName.dacfd.focus();
//		return false;
//	}
	if(!(isDatetime(FormName.dazrsj, "档案转入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.dazcsj, "档案转出时间"))) {
		return false;
	}

	if(	javaTrim(FormName.rzcs)=="") {
		alert("请输入[入职次数]！");
		FormName.rzcs.focus();
		return false;
	}
	if(!(isNumber(FormName.rzcs, "入职次数"))) {
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("请输入[入职日期]！");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.gqpxkssj, "岗前培训开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gqpxjssj, "岗前培训结束时间"))) {
		return false;
	}

	if(!(isInt(FormName.xuhao, "序号"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

