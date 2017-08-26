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
String wheresgph=request.getParameter("sgph");
String sgdw=request.getParameter("sgdw");

String clbm=null;
String clmc=null;
String clgg=null;
double sgsl=0;
double fgsdj=0;
String shsl=null;
String cldlmc=null;
String jldwmc=null;
String zbshr=null;
String zbshsj=null;
String zbshyj=null;
String ejshr=null;
String ejshsj=null;
String ejshyj=null;
String sjshyj=null;

if (wheresgph.equals(""))
{
	return;
}

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">审核单明细(审核批号:<%=wheresgph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
    <tr align="center" bgcolor="#CCCCCC"> 
      <td  width="5%">序号 
        <input type="hidden" name="sgph" value="<%=wheresgph%>">
      </td>
      <td  width="11%">材料名称</td>
      <td  width="10%">材料规格</td>
      <td  width="10%">材料大类</td>
      <td  width="7%">计量单位</td>
      <td  width="7%">单价</td>
      <td  width="7%">库存数量</td>
      <td  width="9%">库存金额</td>
      <td  width="8%">申购数量</td>
      <td  width="9%">申购金额</td>
      <td  width="9%">总金额</td>
      <td  width="8%">审核数量</td>
    </tr>
    <%
try {
	conn=cf.getConnection();

	ls_sql="select zbshr,zbshsj,zbshyj,ejshr,ejshsj,ejshyj,sjshyj";
	ls_sql+=" from cl_clsgd ";
	ls_sql+=" where sgph='"+wheresgph+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		zbshr=cf.fillNull(rs.getString("zbshr"));
		zbshsj=cf.fillNull(rs.getDate("zbshsj"));
		zbshyj=cf.fillHtml(rs.getString("zbshyj"));
		ejshr=cf.fillNull(rs.getString("ejshr"));
		ejshsj=cf.fillNull(rs.getDate("ejshsj"));
		ejshyj=cf.fillHtml(rs.getString("ejshyj"));
		sjshyj=cf.fillHtml(rs.getString("sjshyj"));
	} 
	rs.close();
	ps.close();

	//查询：上期结转日期、上期库存数量
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+sgdw+"' ";
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
	ls_sql+=" where dwbh='"+sgdw+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();

	ls_sql="SELECT sgph,cl_clsgmx.clbm clbm,cl_clsgmx.clmc,cl_clsgmx.clgg,sgsl,cl_clsgmx.cldlmc,jldwmc,shsl,fgsdj ";
	ls_sql+=" FROM cl_clsgmx ";
	ls_sql+=" where sgph='"+wheresgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		sgsl=rs.getDouble("sgsl");
		fgsdj=rs.getDouble("fgsdj");
		shsl=cf.fillNull(rs.getString("shsl"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));

/***************************************************************\
|		查询库存
\***************************************************************/
		double sumrk=0;
		double sumck=0;
		double kcsl=0;
		double sqkcsl=0;
		ls_sql="select cl_ydjzmx.kcsl ";
		ls_sql+=" from cl_ydjzmx,cl_ydjz ";
		ls_sql+=" where cl_ydjzmx.jzph=cl_ydjz.jzph and cl_ydjz.dwbh='"+sgdw+"' and cl_ydjzmx.jzph='"+sqjzph+"' and cl_ydjzmx.clbm='"+clbm+"'";
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
		ls_sql+=" and cl_rkd.dwbh='"+sgdw+"'  ";
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
		ls_sql+=" and cl_ckd.dwbh='"+sgdw+"' ";
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
      <td > 
        <div ><%=i%> 
          <input type="hidden" name="clbm" value="<%=clbm%>">
        </div>
      </td>
      <td > 
        <div align="center"><%=clmc%> 
          <input type="hidden" name="clmc" value="<%=clmc%>">
        </div>
      </td>
      <td > 
        <div align="center"><%=clgg%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=cldlmc%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=jldwmc%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=fgsdj%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=kcsl%>&nbsp;</div>
      </td>
      <td > 
        <div align="center"><%=cf.formatDouble(kcsl*fgsdj)%></div>
      </td>
      <td > 
        <div align="center"><%=sgsl%>&nbsp;</div>
      </td>
       <td > 
        <div align="center"><%=cf.formatDouble(sgsl*fgsdj)%></div>
      </td>
       <td > 
        <div align="center"><%=cf.formatDouble(kcsl*fgsdj+sgsl*fgsdj)%></div>
      </td>
     <td > 
        <input type="text" name="shsl" size="10" maxlength="13" value=<%=shsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(shsl[<%=(row+1)%>])" >
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
		if (rs1!= null) rs.close(); 
		if (ps1!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    <tr> 
      <td colspan="12"><b><font color="#0000CC"><%=zbshr%>（<%=zbshsj%>）：</font></b><BR>
        <%=zbshyj%>
      </td>
    </tr>
    <tr> 
      <td colspan="12"><b><font color="#0000CC"><%=ejshr%>（<%=ejshsj%>）：</font></b><BR>
        <%=ejshyj%>
      </td>
    </tr>
    <tr> 
      <td colspan="12"><b><font color="#0000CC">审核意见：</font></b><BR>
        <textarea name="shyj" rows="3" cols="80"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="8" bgcolor="#FFFFFF" > 
        <input type=button value='审核完成' onClick="cf_delete(listform)" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type=button value='驳回申购单' onClick="cf_submit(listform)" name="sl">
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

function cf_delete(FormName)
{
	var len=<%=i%>-0;
	var m=0,val;
	if (len<=1)
	{
		val=FormName.shsl.value-0;
//		alert(FormName.shsl.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.shsl)=="") {
			alert("材料【"+FormName.clmc.value+"】"+"审核数量不能为空!!!");
			FormName.shsl.focus();
			return false;
		}
		if (!(isFloat(FormName.shsl,"材料【"+FormName.clmc.value+"】"))){
			FormName.shsl.focus();     
			return      
		   }
		if (val<0)
		{
			alert("材料【"+FormName.clmc.value+"】"+"审核数量不能小于零!!!");
			FormName.shsl.focus(); 
			return false;
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (m=0;m<len ;m++ )
		{
			val=FormName.shsl[m].value-0;
	//		alert(FormName.shsl[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.shsl[m])=="") {
				alert("材料【"+FormName.clmc[m].value+"】"+"审核数量不能为空!!!");
				FormName.shsl[m].focus();
				return false;
			}
			if (!(isFloat(FormName.shsl[m],"【"+FormName.clmc[m].value+"】"))){
				FormName.shsl[m].focus();     
				return      
			   }
			if (val<0)
			{
				alert("材料【"+FormName.clmc[m].value+"】"+"审核数量不能小于零!!!");
				FormName.shsl[m].focus(); 
				return false;
			}	
		}
	}
	FormName.action="SaveSjShdgdmx.jsp";
	FormName.submit();
	return true;
} 
function cf_submit(FormName)
{
	FormName.action="DgdSjshBtg.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>

