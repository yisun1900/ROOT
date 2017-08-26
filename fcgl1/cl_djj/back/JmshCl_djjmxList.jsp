<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String czxh=request.getParameter("czxh");
String khbh=request.getParameter("khbh");
String dwbh=(String)session.getAttribute("ssfgs");
String clbm=null;
String clmc=null;
String clgg=null;
double fgsdj=0;
double gdj=0;
double sqlqsl=0;
double sjsl=0;
double sqlqje=0;

double xjsqlqsl=0;
double xjsjsl=0;
double xjsqlqje=0;

String cldlmc=null;
String jldwmc=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String fwmj=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String fgsbh=null;
String dm=null;

String shr=null;
String shsj=null;
String shyj=null;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,fgsbh,fwmj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dm=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();

	ls_sql="select qye,shr,shsj,shyj";
	ls_sql+=" from  cl_djj";
	ls_sql+=" where czxh='"+czxh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		qye=cf.fillNull(rs.getString("qye"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shyj=cf.fillNull(rs.getString("shyj"));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">代金券减免审核(操作序号:<%=czxh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">客户编号</font></div>
      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">合同号</font></div>
      </td>
      <td width="31%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">客户姓名</font></div>
      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="19%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="31%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td width="32%"><%=fwdz%></td>
      <td width="19%" align="right"><font color="#0000CC">质检员</font></td>
      <td width="31%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
      <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dm+"'",dm,true);
%></td>
      <td width="19%" align="right"><font color="#0000CC">设计师</font></td>
      <td width="31%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">工程签约额</div>
      </td>
      <td width="32%"><%=qye%> </td>
      <td width="19%"> 
        <div align="right">房屋面积</div>
      </td>
      <td width="31%"><%=fwmj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">施工队</font></div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="19%"> 
        <div align="right"><font color="#0000CC">施工班组</font></div>
      </td>
      <td width="31%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">合同开工日期</font></td>
      <td width="32%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="19%" align="right"><font color="#0000CC">合同交工日期</font></td>
      <td width="31%"> <%=jgrq%> </td>
    </tr>
  </table>

  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px' >
    <tr  align="center"> 
      <td  width="12%" bgcolor="#CCCCCC">材料大类</td>
      <td  width="8%" bgcolor="#CCCCCC">签约百分比</td>
      <td  width="10%" bgcolor="#CCCCCC">应领取金额</td>
      <td  width="10%" bgcolor="#CCCCCC">累计申领金额</td>
      <td  width="10%" bgcolor="#CCCCCC">差额</td>
      <td  width="10%" bgcolor="#CCCCCC">累计申领比例</td>
      <td  width="30%" bgcolor="#CCCCCC">减免原因</td>
    </tr>
    <%
	
	
	double qybfb=0;
	double sjje=0;
	double ylqje=0;
	String ce=null;
	String jmyy=null;
	double xjylqje=0;
	double xjsjje=0;
	ls_sql="SELECT cl_djjflmx.cldlmc,cl_djjflmx.qybfb,cl_djjflmx.ylqje,cl_djjflmx.sjje,cl_djjflmx.jmyy ";
	ls_sql+=" FROM cl_djjflmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by cldlmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		qybfb=rs.getDouble("qybfb");
		jmyy=cf.fillHtml(rs.getString("jmyy"));
		ylqje=rs.getDouble("ylqje");
		sjje=rs.getDouble("sjje");

		xjylqje+=ylqje;
		xjsjje+=sjje;

		row++;

%> 
    <tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>"> 
      <td > 
        <div align="center"><%=cldlmc%></div>
      </td>
      <td > 
        <div align="center"><%=qybfb%>%</div>
      </td>
      <td > 
        <div align="center"><%=ylqje%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=sjje%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=cf.formatDouble(ylqje-sjje)%></div>
      </td>
      <td > 
        <div align="center"><%=cf.formatDouble(sjje*100.0/ylqje)%>％</div>
      </td>
      <td > <%=jmyy%>
      </td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
%> 
     <tr align="center"> 
      <td colspan="2">小 计</td>
      <td><%=cf.formatDouble(xjylqje)%></td>
      <td><%=cf.formatDouble(xjsjje)%></td>
      <td><%=cf.formatDouble(xjylqje-xjsjje)%></td>
      <td><%=cf.formatDouble(xjsjje*100.0/xjylqje)%>％</td>
      <td>&nbsp;</td>
    </tr>
  </table>

  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
    <input type="hidden" name="czxh" value="<%=czxh%>">
    <input type="hidden" name="khbh" value="<%=khbh%>">
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="3%">序号</td>
      <td  width="12%">材料名称</td>
      <td  width="12%">材料规格</td>
      <td  width="12%">材料大类</td>
      <td  width="8%">计量单位</td>
      <td  width="8%">工队价</td>
      <td  width="8%">库存数量</td>
      <td  width="8%">申请数量</td>
      <td  width="10%">申请金额</td>
      <td  width="8%">审核数量</td>
    </tr>
    <%

	//查询：上期结转日期、上期库存数量
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+fgsbh+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+fgsbh+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();


	ls_sql="SELECT czxh,clbm clbm,clmc,clgg,gdj,sqlqsl,sjsl,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_djjmx ";
	ls_sql+=" where czxh='"+czxh+"' ";
	ls_sql+=" order by cldlmc, clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=rs.getDouble("gdj");
		sqlqsl=rs.getDouble("sqlqsl");
		sjsl=rs.getDouble("sjsl");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));

		sqlqje=cf.doubleTrim(sqlqsl*gdj);

		xjsqlqsl+=sqlqsl;
		xjsjsl+=sjsl;
		xjsqlqje+=sqlqje;

		double sumrk=0;
		double sumck=0;
		double kcsl=0;
		double sqkcsl=0;
		ls_sql="select cl_ydjzmx.kcsl ";
		ls_sql+=" from cl_ydjzmx,cl_ydjz ";
		ls_sql+=" where cl_ydjzmx.jzph=cl_ydjz.jzph and cl_ydjz.dwbh='"+fgsbh+"' and cl_ydjzmx.jzph='"+sqjzph+"' and cl_ydjzmx.clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqkcsl=rs1.getDouble("kcsl");
		}
		rs1.close();
		ps1.close();

		
		ls_sql="select nvl(sum(rksl),0)  ";
		ls_sql+=" from cl_rkmx,cl_rkd  ";
		ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
		ls_sql+=" and cl_rkd.dwbh='"+fgsbh+"'  ";
		ls_sql+=" and clbm='"+clbm+"' ";
		ls_sql+=" and cl_rkd.rkzt='2' and rksj>?";//注意起点不包括等于
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sumrk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="select nvl(sum(cksl),0)  ";
		ls_sql+=" from cl_ckmx,cl_ckd  ";
		ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
		ls_sql+=" and cl_ckd.dwbh='"+fgsbh+"' ";
		ls_sql+=" and cl_ckmx.clbm='"+clbm+"' and cl_ckmx.leixing='1' ";
		ls_sql+=" and cl_ckd.ckzt='2' and cksj>?";//注意起点不包括等于
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sumck=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		kcsl=cf.doubleTrim(sqkcsl+sumrk-sumck);

%> 
    <tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center"> 
      <td> 
        <div align="center"><%=i%>&nbsp; 
          <input type="hidden" name="clbm" value="<%=clbm%>">
          <input type="hidden" name="cldlmc" value="<%=cldlmc%>">
        </div>
      </td>
      <td><%=clmc%>&nbsp;
        <input type="hidden" name="clmc" value="<%=clmc%>">
      </td>
      <td> <%=clgg%> </td>
      <td> <%=cldlmc%> </td>
      <td> <%=jldwmc%> </td>
      <td> <%=gdj%> 
      <td> <%=kcsl%></td>
      <td> <%=sqlqsl%> 
      <td><%=sqlqje%></td>
      <td> 
        <input type="text" name="sjsl" size="8" maxlength="10" value=<%=sjsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sjsl[<%=(row+1)%>])" >
      </td>
    </tr>
    <%
	row++;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
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

xjsqlqsl=cf.doubleTrim(xjsqlqsl);
xjsqlqje=cf.doubleTrim(xjsqlqje);

%> 
    <tr align="center"> 
      <td colspan="4">合计</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=xjsqlqsl%></td>
      <td><%=xjsqlqje%></td>
      <td>&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="10"><b><font color="#0000CC">审核意见：</font></b><BR>
        <textarea name="shyj" rows="3" cols="80"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center">
      <td colspan="10" height="32" ><font color="#FF0033">*</font>审核结论： 
        <input type="radio" name="shjl" value="1">同意
        <input type="radio" name="shjl" value="2">不同意
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="10" > 
        <input type=button value=' 存 盘 ' onClick="cf_submit(listform)" name="sl">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="reset" value=' 重 输 ' name="reset" >
      </td>
    </tr>
  </table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

var mark=1;

function cf_submit(FormName)
{
	var len=<%=i%>-0;
	var m=0,val;
	if (len<=1)
	{
		val=FormName.sjsl.value-0;
//		alert(FormName.sjsl.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.sjsl)=="") {
			alert("材料【"+FormName.clmc.value+"】"+"审核数量不能为空!!!");
			FormName.sjsl.focus();
			return false;
		}
		if (!(isFloat(FormName.sjsl,"材料【"+FormName.clmc.value+"】"))){
			FormName.sjsl.focus();     
			return      
		   }
		if (val<=0)
		{
			alert("材料【"+FormName.clmc.value+"】"+"审核数量不能小于或者等于零!!!");
			FormName.sjsl.focus(); 
			return false;
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (m=0;m<len ;m++ )
		{
			val=FormName.sjsl[m].value-0;
	//		alert(FormName.sjsl[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.sjsl[m])=="") {
				alert("材料【"+FormName.clmc[m].value+"】"+"审核数量不能为空!!!");
				FormName.sjsl[m].focus();
				return false;
			}
			if (!(isFloat(FormName.sjsl[m],"【"+FormName.clmc[m].value+"】"))){
				FormName.sjsl[m].focus();     
				return      
			   }
			if (val<=0)
			{
				alert("材料【"+FormName.clmc[m].value+"】"+"审核数量不能小于或者等于零!!!");
				FormName.sjsl[m].focus(); 
				return false;
			}	
		}
	}

	if(	!radioChecked(FormName.shjl)) {
		alert("请选择[审核结论]！");
		FormName.shjl[0].focus();
		return false;
	}

	FormName.action="SaveJmshCl_djjmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

