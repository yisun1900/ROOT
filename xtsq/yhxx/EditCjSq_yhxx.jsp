<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010202")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
	String dlyhjs=(String)session.getAttribute("yhjs");



String yhdlm=null;
String yhmc=null;
String yhkl=null;
String yhjs=null;
String dwbh=null;
String xb=null;
String csrq=null;
String dh=null;
String email=null;
String zz=null;
String bjjb=null;
String bz=null;
String sjsbh=null;
String ssfgs=null;

String zwbm=null;
String ckjgbz=null;
String zdyhbz=null;
String kdlxtbz=null;
String kkbbz=null;

String sjxzbz=null;
String sbsj=null;
String xbsj=null;
String ipxzbz=null;
String ipdz=null;
String wkxzbz=null;
String wkdz=null;
String khdhbz=null;
String kkglfx=null;
String mmsyzq=null;
String yxdlsbcs=null;
String bsxtsmmzq=null;
String sfyxzhmm=null;

String kfgssq=null;
String sqxz1Style="";
String sqxz2Style="";
String sqxz3Style="";
String sqxz4Style="";
String sqxz5Style="";

String sjsbjjb="";
String dqbm=null;
String sfkdybj=null;
double zdmll=0;
int sqtszkcs=0;


String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select zdmll,sfkdybj,sfyxzhmm,kfgssq,mmsyzq,yxdlsbcs,bsxtsmmzq,kkglfx,khdhbz,yhdlm,yhmc,yhkl,yhjs,dwbh,xb,csrq,dh,email,zz,bz,zwbm,ckjgbz,zdyhbz,kdlxtbz,bjjb,sjsbh,ssfgs,kkbbz,sjxzbz,sbsj,xbsj,ipxzbz,ipdz,wkxzbz,wkdz,sqtszkcs ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh='"+whereygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqtszkcs=rs.getInt("sqtszkcs");
		zdmll=rs.getDouble("zdmll");

		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));
		sfyxzhmm=cf.fillNull(rs.getString("sfyxzhmm"));
		kfgssq=cf.fillNull(rs.getString("kfgssq"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		bsxtsmmzq=cf.fillNull(rs.getString("bsxtsmmzq"));
		kkglfx=cf.fillNull(rs.getString("kkglfx"));
		khdhbz=cf.fillNull(rs.getString("khdhbz"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhjs=cf.fillNull(rs.getString("yhjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xb=cf.fillNull(rs.getString("xb"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		dh=cf.fillNull(rs.getString("dh"));
		email=cf.fillNull(rs.getString("email"));
		zz=cf.fillNull(rs.getString("zz"));
		bz=cf.fillNull(rs.getString("bz"));

		zwbm=cf.fillNull(rs.getString("zwbm"));
		ckjgbz=cf.fillNull(rs.getString("ckjgbz"));
		zdyhbz=cf.fillNull(rs.getString("zdyhbz"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		kkbbz=cf.fillNull(rs.getString("kkbbz"));

		sjxzbz=cf.fillNull(rs.getString("sjxzbz"));
		sbsj=cf.fillNull(rs.getString("sbsj"));
		xbsj=cf.fillNull(rs.getString("xbsj"));
		ipxzbz=cf.fillNull(rs.getString("ipxzbz"));
		ipdz=cf.fillNull(rs.getString("ipdz"));
		wkxzbz=cf.fillNull(rs.getString("wkxzbz"));
		wkdz=cf.fillNull(rs.getString("wkdz"));

		if (kkglfx.equals(""))
		{
			kkglfx="N";
		}
		if (yhkl.equals(""))
		{
			yhkl="111111";
			mmsyzq="90";
			yxdlsbcs="5";
			bsxtsmmzq="15";
		}

		if (sfyxzhmm.equals(""))
		{
			sfyxzhmm="N";
		}
	
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("1") )//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		sqxz1Style="display:block";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}
	else if ( kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		sqxz1Style="display:none";
		sqxz2Style="display:block";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}
	else if (kfgssq.equals("3") )
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:block";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}
	else if ( kfgssq.equals("4") )
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:block";
		sqxz5Style="display:none";
	}
	else if ( kfgssq.equals("5"))
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:block";
	}
	else 
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	String bjjbbm=null;
	String bjjbmc=null;
	ls_sql="select bjjbbm,bjjbmc ";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" order by bjjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_jzbjb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		if (count>0)
		{
			bjjbmc=bjjbmc+"（有报价）";
		}
	
		ls_sql="select count(*)";
		ls_sql+=" from  sq_sjsbjjb";
		ls_sql+=" where ygbh="+whereygbh+"  and bjjbbm='"+bjjbbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			sjsbjjb+="<option value='"+bjjbbm+"' SELECTED >"+bjjbmc+"</option>\r\n";
		}
		else
		{
			sjsbjjb+="<option value='"+bjjbbm+"'>"+bjjbmc+"</option>\r\n";
		}
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
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
      <div align="center"> 系统授权</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr> 
			  <td colspan="4" height="2"> 
				<div align="center"> 
				  <input type="button"  value="保存" onClick="f_do(editform)">
				  <input type="reset"  value="重输">
				  <input type="button"  value="系统授权" onClick="f_sq(editform)">
				  <input type="button"  value="重置密码" onClick="editform.yhkl.value='111111'">
				</div>			  </td>
			</tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>所属分公司</td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
                </select>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>所属所属部门</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属部门小组</td>
              <td width="32%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh);
%> 
                </select>              </td>
              <td width="17%" align="right">用户名称</td>
              <td width="33%"><%=yhmc%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>用户登陆名</div>              </td>
              <td width="32%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >              </td>
              <td width="17%"> 
              <div align="right"><font color="#FF0000">*</font><font color="#0000FF">用户口令</font></div>              </td>
              <td width="33%"> 
              <input type="text" name="yhkl" size="20" maxlength="50"  value="<%=yhkl%>" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>用户角色</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A0+总部&A1+总部各部门&F0+分公司&F1+分公司各部门&F2+店面",yhjs);
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right"><font color="#FF0000">*</font>重点用户标志</div>              </td>
              <td width="33%"><%
	cf.radioToken(out, "zdyhbz","Y+重点用户&N+非重点用户",zdyhbz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>允许看价格明细</td>
              <td><%
	cf.radioToken(out, "ckjgbz","Y+可看&N+不可看",ckjgbz);
%></td>
              <td width="17%" rowspan="4" align="right">电子报价[其它收费项目]授权</td>
              <td width="33%" rowspan="4">
			  <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                <option value=""></option>
<%
	cf.mutilSelectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' and sfxsq='2' order by sfxmbm","select sfxmbm from sq_sfxmsq where ygbh='"+whereygbh+"'");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>允许看工料分析</td>
              <td><%
	cf.radioToken(out, "kkglfx","Y+可看&N+不可看",kkglfx);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否可打印报价</td>
              <td><%
	cf.radioToken(out, "sfkdybj","Y+需授权打印&N+不需授权打印&M+不能打印",sfkdybj);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>允许看客户电话</td>
              <td width="32%"><%
	cf.radioToken(out, "khdhbz","N+不可看&Y+可看",khdhbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>可拷贝标志</td>
              <td width="32%" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "kkbbz","Y+可拷贝&N+不可拷贝",kkbbz);
%></td>
              <td rowspan="3" align="right">设计师报价级别</td>
              <td rowspan="3"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
                  <option value=""></option>
                  <%=sjsbjjb%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>工种</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm",zwbm);
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>是否允许找回密码</td>
              <td width="32%"><%
	cf.radioToken(out, "sfyxzhmm","Y+允许&N+否",sfyxzhmm);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="22" bgcolor="#CCCCFF"><font color="#FF0000">*</font>可登陆系统标志</td>
              <td width="32%" height="22" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "kdlxtbz","Y+可登陆&N+不可登陆",kdlxtbz);
%></td>
              <td rowspan="11" align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>客户资料授权范围 </td>
              <td rowspan="4" height="22" bgcolor="#CCFFFF"> 
                <input type="radio" name="kfgssq" value="0" <% if (kfgssq.equals("0")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                不授权<BR>
                <input type="radio" name="kfgssq" value="1" <% if (kfgssq.equals("1")) out.print("checked");%> onClick="sqxz1.style.display ='block';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                授权单个分公司<BR>
                <input type="radio" name="kfgssq" value="2" <% if (kfgssq.equals("2")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='block';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                授权多个分公司<BR>
                <input type="radio" name="kfgssq" value="3" <% if (kfgssq.equals("3")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='block';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                授权单个店面<BR>
                <input type="radio" name="kfgssq" value="4" <% if (kfgssq.equals("4")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='block';sqxz5.style.display ='none';">
                授权某一分公司多个店面<BR>
                <input type="radio" name="kfgssq" value="5" <% if (kfgssq.equals("5")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='block';">
                授权多个分公司多个店面 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>时间限制标志</td>
              <td width="32%"><%
	cf.radioToken(out, "sjxzbz","Y+限制&N+不限制",sjxzbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">上班时间</td>
              <td width="32%"> 
                <input type="text" name="sbsj" size="10" maxlength="8"  value="<%=sbsj%>" >
                （24小时整数） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">下班时间</td>
              <td width="32%"> 
                <input type="text" name="xbsj" size="10" maxlength="8"  value="<%=xbsj%>" >
                （24小时整数） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>IP地址限制标志</td>
              <td width="32%"><%
	cf.radioToken(out, "ipxzbz","Y+限制&N+不限制",ipxzbz);
%></td>
              <td rowspan="7" bgcolor="#CCFFFF">

                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz1" style="<%=sqxz1Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz1Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwbh='"+ssfgs+"'","select ssfgs from sq_sqfgs where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>

                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz2" style="<%=sqxz2Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz2Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx in('A0','F0') order by cxbz,dwbh","select ssfgs from sq_sqfgs where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>



                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz3" style="<%=sqxz3Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz3Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）'||DECODE(a.cxbz,'N','','Y','『撤销』') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>



                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz4" style="<%=sqxz4Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz4Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）'||DECODE(a.cxbz,'N','','Y','『撤销』') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>


                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz5" style="<%=sqxz5Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz5Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
	if (dlyhjs.equals("A0") || dlyhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）'||DECODE(a.cxbz,'N','','Y','『撤销』') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
	}
	else{
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）'||DECODE(a.cxbz,'N','','Y','『撤销』') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
	}
						%> 
                      </select>                    </td>
                  </tr>
                </table>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">IP地址</td>
              <td width="32%"> 
                <input type="text" name="ipdz" size="20" maxlength="20"  value="<%=ipdz%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>网卡地址限制标志</td>
              <td width="32%"><%
	cf.radioToken(out, "wkxzbz","Y+限制&N+不限制",wkxzbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">网卡地址</td>
              <td width="32%"> 
                <input type="text" name="wkdz" size="20" maxlength="20"  value="<%=wkdz%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>密码使用周期</td>
              <td width="32%"> 
                <input type="text" name="mmsyzq" size="10" maxlength="16"  value="<%=mmsyzq%>" >
                天 <br>
                <b><font color="#0000CC">密码使用超过这个时间强制修改密码</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>允许登陆失败次数</td>
              <td width="32%"> 
                <input type="text" name="yxdlsbcs" size="10" maxlength="16"  value="<%=yxdlsbcs%>" >
                <font color="#0000CC"><b>连续登陆失败后锁帐号</b></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>不上系统锁密码周期</td>
              <td width="32%"> 
                <input type="text" name="bsxtsmmzq" size="10" maxlength="16"  value="<%=bsxtsmmzq%>" >
                天 <br>
                <font color="#0000CC"><b>超过一定时间不上系统自动锁帐号</b></font> </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="button"  value="系统授权" onClick="f_sq(editform)" name="button">
                  <input type="button"  value="重置密码" onClick="editform.yhkl.value='111111'">
                </div>              </td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhjs)=="") {
		alert("请选择[用户角色]！");
		FormName.yhjs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[所属单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ckjgbz)) {
		alert("请选择[允许查看价格明细]！");
		FormName.ckjgbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdyhbz)) {
		alert("请选择[重点用户标志]！");
		FormName.zdyhbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kkbbz)) {
		alert("请选择[可拷贝标志]！");
		FormName.kkbbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("请选择[可登陆系统标志]！");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khdhbz)) {
		alert("请选择[查看客户电话标志]！");
		FormName.khdhbz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyxzhmm)) {
		alert("请选择[是否允许找回密码]！");
		FormName.sfyxzhmm[0].focus();
		return false;
	}
/*	
	if (FormName.kdlxtbz[0].checked)
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("请输入[用户登陆名]！");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("请输入[用户口令]！");
			FormName.yhkl.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhdlm)!="") {
			alert("请取消[用户登陆名]！");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)!="") {
			alert("请取消[用户口令]！");
			FormName.yhkl.focus();
			return false;
		}
	}
*/


	if(	javaTrim(FormName.zwbm)=="") {
		alert("请选择[工种]！");
		FormName.zwbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sjxzbz)) {
		alert("请选择[时间限制标志]！");
		FormName.sjxzbz[0].focus();
		return false;
	}
	if (FormName.sjxzbz[0].checked)
	{
		if(	javaTrim(FormName.sbsj)=="") {
			alert("请选择[上班时间]！");
			FormName.sbsj.focus();
			return false;
		}
		if(!(isNumber(FormName.sbsj, "上班时间"))) {
			return false;
		}
		if(	javaTrim(FormName.xbsj)=="") {
			alert("请选择[下班时间]！");
			FormName.xbsj.focus();
			return false;
		}
		if(!(isNumber(FormName.xbsj, "下班时间"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.ipxzbz)) {
		alert("请选择[IP地址限制标志]！");
		FormName.ipxzbz[0].focus();
		return false;
	}
	if (FormName.ipxzbz[0].checked)
	{
		if(	javaTrim(FormName.ipdz)=="") {
			alert("请选择[IP地址]！");
			FormName.ipdz.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.wkxzbz)) {
		alert("请选择[网卡地址限制标志]！");
		FormName.wkxzbz[0].focus();
		return false;
	}
	if (FormName.wkxzbz[0].checked)
	{
		if(	javaTrim(FormName.wkdz)=="") {
			alert("请选择[网卡地址]！");
			FormName.wkdz.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.mmsyzq)=="") {
		alert("请输入[密码使用周期]！");
		FormName.mmsyzq.focus();
		return false;
	}
	if(!(isInt(FormName.mmsyzq, "密码使用周期"))) {
		return false;
	}
	if(	javaTrim(FormName.yxdlsbcs)=="") {
		alert("请输入[允许登陆失败次数]！");
		FormName.yxdlsbcs.focus();
		return false;
	}
	if(!(isInt(FormName.yxdlsbcs, "允许登陆失败次数"))) {
		return false;
	}
	if(	javaTrim(FormName.bsxtsmmzq)=="") {
		alert("请输入[不上系统锁密码周期]！");
		FormName.bsxtsmmzq.focus();
		return false;
	}
	if(!(isInt(FormName.bsxtsmmzq, "不上系统锁密码周期"))) {
		return false;
	}


	if(	!radioChecked(FormName.kfgssq)) {
		alert("请选择[客户资料授权范围]！");
		FormName.kfgssq[0].focus();
		return false;
	}

	if (FormName.kfgssq[1].checked  )//从下拉列表选
	{
		if(	!selectChecked(FormName.sqxz1Value)) {
			alert("请选择[授权分公司]！");
			FormName.sqxz1Value.focus();
			return false;
		}
	}
	else if ( FormName.kfgssq[2].checked)//从下拉列表选
	{
		if(	!selectChecked(FormName.sqxz2Value)) {
			alert("请选择[授权分公司]！");
			FormName.sqxz2Value.focus();
			return false;
		}
	}
	else if (FormName.kfgssq[3].checked  )//从下拉列表选
	{
		if(	!selectChecked(FormName.sqxz3Value)) {
			alert("请选择[授权店面]！");
			FormName.sqxz3Value.focus();
			return false;
		}
	}
	else if ( FormName.kfgssq[4].checked )//从下拉列表选
	{
		if(	!selectChecked(FormName.sqxz4Value)) {
			alert("请选择[授权店面]！");
			FormName.sqxz4Value.focus();
			return false;
		}
	}
	else if ( FormName.kfgssq[5].checked)//从下拉列表选
	{
		if(	!selectChecked(FormName.sqxz5Value)) {
			alert("请选择[授权店面]！");
			FormName.sqxz5Value.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.sfkdybj)) {
		alert("请选择[是否可打印报价]！");
		FormName.sfkdybj[0].focus();
		return false;
	}



	FormName.action="SaveEditSq_yhxx.jsp";
	FormName.submit();
	return true;
}
function f_sq(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("请输入[用户登陆名]！");
		FormName.yhdlm.focus();
		return false;
	}

	FormName.action="/xtsq/xtsq/grouptouserCj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
