<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String jc_mmydd_khxm=null;
String jc_mmydd_lxfs=null;
String jc_mmydd_fwdz=null;
String jc_mmydd_jhccsj=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	    conn=cf.getConnection();
	    ls_sql="select khxm,lxfs,fwdz,jhccsj";
	    ls_sql+=" from  jc_mmydd";
		ls_sql+=" where yddbh='"+yddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_mmydd_lxfs=cf.fillNull(rs.getString("lxfs"));
		   jc_mmydd_fwdz=cf.fillNull(rs.getString("fwdz"));
		   jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		   
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
<title>松下亿达家具/壁柜门订购合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td><div align="center"><strong>元 洲 木 门 测 量 单</strong></div></td>
  </tr>
  <tr align="right"> 
    <td width="34%"><div align="right"><strong>NO.：<%=yddbh%></strong></div></td>
  </tr>
  <tr> 
    <td><table width="100%" border="0">
      <tr>
        <td width="280" scope="row">客户姓名：<%=jc_mmydd_khxm%></td>
        <td width="265" scope="row">联系电话：<%=jc_mmydd_lxfs%></td>
        <td width="200">测量时间：<%=jc_mmydd_jhccsj%></td>
      </tr>
      <tr>
        <td colspan="2" scope="row">施工地址：<%=jc_mmydd_fwdz%></td>
        <td>现场班长/电话：</td>
      </tr>
      <tr>
        <td colspan="3" scope="row"> <div align="left"><strong>请客户确认以下原洞口尺寸、地板（地砖）厚度，施工人员确保按修改后净门洞（安装完地板）尺寸施工，并确认签字。 </strong></div></td>
        </tr>
    </table>
    </td>
  </tr>
  <tr> 
    <td>
      <table width="100%" border="0">
        <tr> 
          <td><table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">单口</td>
	<td  width="4%">双口</td>
	<td  width="8%">原门洞（内径）尺寸（mm）</td>
	<td  width="5%">地 材（mm）</td>
	<td  width="6%">修改后净门洞尺寸（mm）</td>
	<td  width="4%">门扇尺寸</td>

</tr>
     <%

	ls_sql="SELECT rownum,azwzmc,kqfxmc,'','',jc_mmdgdmx.qh||'×'||jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg md,dczlmc,'',''  ";
	ls_sql+=" FROM jdm_azwzbm,jdm_kqfxbm,jc_mmdgdmx,jdm_dczlbm ";
    ls_sql+=" where jdm_azwzbm.azwzbm=jc_mmdgdmx.azwzbm and jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by rownum";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();

%>
          </table>
          <table width="100%" border="0">
              <tr> 
                <td width="100%"><table width="765" border="0">
                  <tr>
                    <td scope="row"><div align="left">备注：</div>                      </td>
                    </tr>
                </table> 
                </td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><strong>特殊提示：如您订购的是复合木地板，1.5m范围内地面落差超过2--3mm，必须对地面进行找平处理。 售后服务电话：84291188——项目管理部</strong></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="151"><table width="757" border="0">
        <tr>
          <td width="175" height="15">客户签字：</td>
          <td width="190">现场班长签字：</td>
          <td width="213">测量师签字：</td>
          <td width="161">测量师电话：</td>
        </tr>
      </table>      
    <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
