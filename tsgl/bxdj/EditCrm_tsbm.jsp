<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改报修原因</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String tsjlh=request.getParameter("tsjlh");
String tsyybm=request.getParameter("tsyybm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

String ssfgs=null;

String tslxbm=null;
String tsxlbm=null;
String tsbm=null;

String jcppbz="Y";
String tsppstr="";

String rglrbz="";//人工录入标志
String rglrtspp="";
String xllbStyle="";
String rglrStyle="";
String ygbh=null;

try {
	conn=cf.getConnection();

	ls_sql="select crm_tsjl.khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx,crm_tsjl";
	ls_sql+=" where crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select tslxbm,tsxlbm,dwbh,ygbh";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		tsbm=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
	}
	rs.close();
	ps.close();

	//处理：人工录入标志＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int sl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and rglrbz='2' ";//1：系统取得2：人工录入
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sl>0)
	{
		ls_sql="select tspp";
		ls_sql+=" from  crm_tsbm";
		ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and rglrbz='2' ";//1：系统取得2：人工录入
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			rglrtspp=rs.getString(1);
		}
		rs.close();
		ps.close();

		rglrbz="2";//1：系统取得2：人工录入

		xllbStyle="display:none";
		rglrStyle="display:block";
	}
	else{
		rglrbz="1";//1：系统取得2：人工录入

		xllbStyle="display:block";
		rglrStyle="display:none";
	}
	//处理：人工录入标志＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//是否启用集成订单
	ls_sql="select jcppbz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jcppbz=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	//生成 被报修供应商 下拉框＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (tslxbm.equals("12"))
	{
		String gyslb="";
		if (tsxlbm.equals("1201"))//橱柜报修
		{
			gyslb="2";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("1202"))//木门报修
		{
			gyslb="1";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("1203"))//主材报修
		{
			gyslb="4";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("1204"))//家具报修
		{
			gyslb="3";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("2301"))//橱柜报修
		{
			gyslb="2";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("2302"))//木门报修
		{
			gyslb="1";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("2303"))//家具报修
		{
			gyslb="3";//1：木门；2：橱柜；3：家具；4：主材
		}
		else if (tsxlbm.equals("2304"))//外主材报修
		{
			gyslb="4";//1：木门；2：橱柜；3：家具；4：主材
		}

		if (jcppbz.equals("N"))//是否启用集成订单:Y：启用；N：否
		{
			if (!gyslb.equals(""))
			{
				String tspp=null;

				ls_sql="select distinct jxc_ppgysdzb.ppmc";
				ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
				ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+ssfgs+"' ";
				ls_sql+=" order  by jxc_ppgysdzb.ppmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("ppmc");

					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
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
						tsppstr+="<option value=\""+tspp+"\" selected>"+tspp+"(主材)</option>";	
					}
					else{
						tsppstr+="<option value=\""+tspp+"\">"+tspp+"(主材)</option>";	
					}

				}
				rs.close();
				ps.close();
			}
		}
		else{
			//因有的供应商已删除，要从订单取
			String ppmc=null;
			String gys=null;
			String tspp=null;
			if (gyslb.equals("1"))//1：木门；2：橱柜；3：家具；4：主材
			{
				//木门
				ls_sql="select distinct pdgcmc,ppmc,gys";
				ls_sql+=" from  jc_mmydd";
				ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
				ls_sql+=" order by pdgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("pdgcmc");
					ppmc=rs.getString("ppmc");
					gys=rs.getString("gys");

					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
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
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(木门)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(木门)</option>";	
					}


				}
				rs.close();
				ps.close();
			}
			else if (gyslb.equals("2"))//1：木门；2：橱柜；3：家具；4：主材
			{
				//橱柜
				ls_sql="select distinct pdgcmc,ppmc,gys";
				ls_sql+=" from  jc_cgdd";
				ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
				ls_sql+=" order by pdgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("pdgcmc");
					ppmc=rs.getString("ppmc");
					gys=rs.getString("gys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
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
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(橱柜)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(橱柜)</option>";	
					}

				}
				rs.close();
				ps.close();
			}
			else if (gyslb.equals("3"))//1：木门；2：橱柜；3：家具；4：主材
			{
				//家具
				ls_sql="select distinct pdgcmc,jjppmc,jjgys";
				ls_sql+=" from  jc_jjdd";
				ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
				ls_sql+=" order by pdgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("pdgcmc");
					ppmc=rs.getString("jjppmc");
					gys=rs.getString("jjgys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
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
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(家具)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(家具)</option>";	
					}

				}
				rs.close();
				ps.close();

				//型材门
				ls_sql="select distinct xcmgcmc,xcmgys,xcmppmc";
				ls_sql+=" from  jc_jjdd";
				ls_sql+=" where khbh='"+khbh+"' and xcmgcmc is not null";
				ls_sql+=" order by xcmgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("xcmgcmc");
					ppmc=rs.getString("xcmppmc");
					gys=rs.getString("xcmgys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
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
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(型材门)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(型材门)</option>";	
					}
				}
				rs.close();
				ps.close();
			}
			else if (gyslb.equals("4"))//1：木门；2：橱柜；3：家具；4：主材
			{
				//主材
				ls_sql="select distinct ppbm,ppmc,gys";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"' and ppbm is not null";
				ls_sql+=" order by ppbm";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("ppbm");
					ppmc=rs.getString("ppmc");
					gys=rs.getString("gys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
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
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(主材)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(主材)</option>";	
					}

				}
				rs.close();
				ps.close();
			}
		}
	}
	//生成 被报修供应商 下拉框=========================完成


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#FFFFFF">

<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">修改报修原因（报修记录号：<%=tsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_tsbm.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>              </td>
              <td width="33%"> <%=khbh%> 
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>">              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">合同号</font></div>              </td>
              <td width="33%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>              </td>
              <td width="33%"> <%=khxm%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>              </td>
              <td width="33%"> <%=sjs%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">质检员</font></div>              </td>
              <td width="33%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>报修大类</td>
              <td width="33%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getXlItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tsdl='1' order by tslxbm",tslxbm);
%> 
                </select>              </td>
              <td width="17%" rowspan="6" align="right" valign="top">涉及厂商</td>
              <td width="33%" rowspan="6" valign="top"> 
				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="xllb" style="<%=xllbStyle%>">
					<tr>
					  <td >
						<select name="tspp" style="FONT-SIZE:12PX;WIDTH:252PX" >
						  <option value=""></option>
						  <%=tsppstr%> 
						</select>					  </td>
					</tr>
				  </table>

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="rglr" style="<%=rglrStyle%>">
					<tr>
					  <td >
						<input type="text" name="rglrtspp" value="<%=rglrtspp%>" size="34" maxlength="50" >					  </td>
					</tr>
				  </table>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>报修小类</td>
              <td width="33%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getYyItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tslxbm='"+tslxbm+"' order by tsxlbm",tsxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>报修原因</td>
              <td width="33%"> 
                <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsxlbm='"+tsxlbm+"' order by tsyybm",tsyybm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right"><font color="#FF0033">*</font>责任部门</td>
              <td width="33%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(insertform)">
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,tsbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>负责人</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+tsbm+"' order by yhmc",ygbh);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">涉及厂商</td>
              <td width="33%">
<%
	if (zdyhbz.equals("Y"))
	{
		%> 
		<input type="radio" name="rglrbz" value="1" <% if (rglrbz.equals("1")) out.print("checked");%> onClick="xllb.style.display ='block';rglr.style.display ='none';">
		从下拉列表选 
		<input type="radio" name="rglrbz" value="2" <% if (rglrbz.equals("2")) out.print("checked");%> onClick="xllb.style.display ='none';rglr.style.display ='block';">
		人工录入 
		<%
	}
	else{
		%> 
		<input type="radio" name="rglrbz" value="1" checked >
		从下拉列表选 
		<%
	}
%>			  </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="tsjlh"  value="<%=tsjlh%>" >
                <input type="hidden" name="wheretsyybm"  value="<%=tsyybm%>" >
                <input type="hidden" name="khbh"  value="<%=khbh%>" >
                <input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
                <input type="hidden" name="jcppbz"  value="<%=jcppbz%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
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

<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function getXlItem(FormName)
{
	if (FormName.tslxbm.value=='')
	{
		return;
	}

	czlx=1;

	FormName.tsxlbm.length=1;
	FormName.tsyybm.length=1;
	FormName.tspp.length=1;
	FormName.dwbh.value="";

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tslxbm="+FormName.tslxbm.value;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getYyItem(FormName)
{
	if (FormName.tsxlbm.value=='')
	{
		return;
	}

	czlx=2;

	FormName.tsyybm.length=1;

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tsxlbm="+FormName.tsxlbm.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getZrbm(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;

	czlx=3;

	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		insertform.tsxlbm.length=1;
		var value1=getStrValue(ajaxRetStr,1);
		strToSelect(insertform.tsxlbm,value1);
	}
	else if (czlx==2)
	{
		insertform.tsyybm.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(insertform.tsyybm,value3);

		insertform.tspp.length=1;
		var value4=getStrValue(ajaxRetStr,4);
		strToSelect(insertform.tspp,value4);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ygbh,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("请选择[报修大类]！");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("请选择[报修小类]！");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("请选择[报修原因]！");
		FormName.tsyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[责任部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请选择[负责人]！");
		FormName.ygbh.focus();
		return false;
	}


/*
	if (FormName.tslxbm.value=="12")
	{
		<%
		if (zdyhbz.equals("Y"))
		{
			%> 
			if (FormName.rglrbz[0].checked)//从下拉列表选
			{
				if(	javaTrim(FormName.tspp)=="") {
					alert("请从列表中选择[涉及厂商]，若列表中不存在，可选择【人工录入】！");
					FormName.tspp.focus();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.rglrtspp)=="") {
					alert("请人工录入[涉及厂商]！");
					FormName.rglrtspp.focus();
					return false;
				}
			}
			<%
		}
		else{
			%> 
			if(	javaTrim(FormName.tspp)=="") {
				alert("请从列表中选择[涉及厂商]！");
				FormName.tspp.focus();
				return false;
			}
			<%
		}
		%>
	}
*/


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
