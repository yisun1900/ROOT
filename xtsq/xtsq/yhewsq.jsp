<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=null;
String qxlx=null;
yhdlm=request.getParameter("yhdlm");
qxlx=request.getParameter("qxlx");
if (yhdlm==null)
{
	yhdlm="";
}
if (qxlx==null)
{
	qxlx="";
}
yhdlm=yhdlm.trim();
int row=0;

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接

	
	if (!(yhdlm.equals("")))
	{
		sql="select count(*) from sq_yhxx where yhdlm='"+yhdlm+"'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		int count=0;
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		if (count<1)
		{
			out.println("没有此用户");
		}
		rs.close();
		ps.close();
	}
%>
<html>
<head>
<title>系统授权</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK HREF='/js/menu.css' REL='stylesheet' TYPE='text/css'>
</head>


 <SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script>
sA = new Array ;//开关状态
iA = new Array ;//菜单编号
<%

	String cdbh=null;
	String cdxsmc=null;
	String glurl=null;
	String fcdbh=null;
	String zfcdbh=null;
	String zzfcdbh=null;
	String sfmjcd=null;
	String cdsm=null;
	int cdxh=0;
	String fatherName=null;
	String thisName=null;

	if (!yhdlm.equals(""))
	{
		row=0;
		sql="select cdbh,cdxsmc,glurl,fcdbh,zfcdbh,zzfcdbh,sfmjcd,cdsm,cdxh";
		sql+=" from sq_cd ";
		sql+=" where cdbh not in('0106','010601','010602')";
		sql+=" order by cdbh,cdxh";
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			cdbh=rs.getString("cdbh").trim();
			cdxsmc=rs.getString("cdxsmc");
			glurl=rs.getString("glurl");
			fcdbh=rs.getString("fcdbh").trim();
			zfcdbh=rs.getString("zfcdbh").trim();
			zzfcdbh=rs.getString("zzfcdbh").trim();
			sfmjcd=rs.getString("sfmjcd");
			cdsm=rs.getString("cdsm");
			cdxh=rs.getInt("cdxh");

			thisName="cdbh"+cdbh;
			if (fcdbh.equals("0"))
			{
				fatherName="foldersTree";
			}
			else{
				fatherName="cdbh"+fcdbh;
			}
			String mark="";
			if (!(yhdlm.equals("")))
			{
				sql="select cdbh from sq_yhewqx where yhdlm='"+yhdlm+"' and cdbh='"+cdbh+"' and qxlx='"+qxlx+"'";
				ps1=conn.prepareStatement(sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					mark="checked";
				}
				rs1.close();
				ps1.close();
			}


			if (cdbh.length()==2)
			{
				if (sfmjcd.equals("N"))
				{
					%>sA[<%=row%>]="1";iA[<%=row%>]="<%=cdbh%>";<%
				}
				else{
					%>sA[<%=row%>]="1";iA[<%=row%>]="<%=cdbh%>";<%
				}
			}
			else if (cdbh.length()==4)
			{
				if (sfmjcd.equals("N"))
				{
					%>sA[<%=row%>]="0";iA[<%=row%>]="<%=cdbh%>";<%
				}
				else{
					%>sA[<%=row%>]="0";iA[<%=row%>]="<%=cdbh%>";<%
				}
			}
			else if (cdbh.length()==6)
			{
				if (sfmjcd.equals("N"))
				{
					%>sA[<%=row%>]="0";iA[<%=row%>]="<%=cdbh%>";<%
				}
				else{
					%>sA[<%=row%>]="0";iA[<%=row%>]="<%=cdbh%>";<%
				}
			}
			else if (cdbh.length()==8)
			{
				if (sfmjcd.equals("N"))
				{
					%>sA[<%=row%>]="0";iA[<%=row%>]="<%=cdbh%>";<%
				}
				else{
					%>sA[<%=row%>]="0";iA[<%=row%>]="<%=cdbh%>";<%
				}
			}

			row++;

		}
		rs.close();
		ps.close();
	}
%>


function cLN(cdbh,row) 
{ 
	var mqcdbh="0";//菜单编号
	var fcdbh="0";//父菜单编号
	var zfcdbh="0";//祖父菜单编号
	var zzfcdbh="0";//曾祖父菜单编号

	for (var i=row+1;i< <%=row%> ;i++ )
	{

		mqcdbh=iA[i];

		fcdbh=mqcdbh.substring(0,mqcdbh.length-2);
		zfcdbh=mqcdbh.substring(0,mqcdbh.length-4);
		zzfcdbh=mqcdbh.substring(0,mqcdbh.length-6);

		if (fcdbh==cdbh)
		{
			if (sA[i]=='1')//开--->关
			{
				eval("id"+iA[i]+".style.display ='none'"); //open->close  
				sA[i]='0';
			}
			else{
				eval("id"+iA[i]+".style.display ='block'"); //open->close  
				sA[i]='1';
			}
		}
		else if (zfcdbh==cdbh)
		{
			if (sA[i]=='1')
			{
				eval("id"+iA[i]+".style.display ='none'"); //open->close  
				sA[i]='0';
			}
		}
		else if (zzfcdbh==cdbh)
		{
			if (sA[i]=='1')
			{
				eval("id"+iA[i]+".style.display ='none'"); //open->close  
				sA[i]='0';
			}
		}

		else if (fcdbh=='')
		{
			break;
		}

	}
} 

function cST(cdbh,row) 
{ 
	var mqcdbh="0";//菜单编号
	var fcdbh="0";//父菜单编号
	var zfcdbh="0";//祖父菜单编号
	var zzfcdbh="0";//曾祖父菜单编号


	var sfxz=eval("authname.cdbh"+cdbh+".checked");//是否被选择

	if (sfxz)
	{
		mqcdbh=cdbh;

		fcdbh=mqcdbh.substring(0,mqcdbh.length-2);
		zfcdbh=mqcdbh.substring(0,mqcdbh.length-4);
		zzfcdbh=mqcdbh.substring(0,mqcdbh.length-6);

		if (fcdbh!=='')
		{
			eval("authname.cdbh"+fcdbh+".checked=true");
		}
		if (zfcdbh!=='')
		{
			eval("authname.cdbh"+zfcdbh+".checked=true");
		}
		if (zzfcdbh!=='')
		{
			eval("authname.cdbh"+zzfcdbh+".checked=true");
		}
	}



	for (var i=row+1;i< <%=row%> ;i++ )
	{
		mqcdbh=iA[i];

		fcdbh=mqcdbh.substring(0,mqcdbh.length-2);
		zfcdbh=mqcdbh.substring(0,mqcdbh.length-4);
		zzfcdbh=mqcdbh.substring(0,mqcdbh.length-6);

		if (fcdbh==cdbh)
		{
			if (sfxz)
			{
				eval("authname.cdbh"+iA[i]+".checked=true");
			}
			else{
				eval("authname.cdbh"+iA[i]+".checked=false");
			}
		}
		else if (zfcdbh==cdbh)
		{
			if (sfxz)
			{
				eval("authname.cdbh"+iA[i]+".checked=true");
			}
			else{
				eval("authname.cdbh"+iA[i]+".checked=false");
			}
		}
		else if (zzfcdbh==cdbh)
		{
			if (sfxz)
			{
				eval("authname.cdbh"+iA[i]+".checked=true");
			}
			else{
				eval("authname.cdbh"+iA[i]+".checked=false");
			}
		}
		else if (fcdbh=='')
		{
			break;
		}
	}

}

</SCRIPT>



<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5>
<center>
  <table width="100%" border="0">
    <tr>
      <td align="center">为用户授额外权限</td>
  </tr>
  <tr>
      <td align="center" height="238"> 
        <form action="saveyhewsq.jsp" method="post" name="authname">
          <table width="100%" border="1">
            <tr> 
              <td align="left"> <font style="FONT-SIZE:14px;color='#000066'" ><b>选择用户编号</b></font> 
                <select name="yhdlm" style="FONT-SIZE:14px;WIDTH:240px"  onchange="changeuser(authname)">
                  <option value=""></option>
<%
	cf.selectItem(out,conn,"select yhdlm,concat(yhdlm,yhmc)||'（'||dwmc||'）'  from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sfzszg in('Y','N') and yhdlm is not null and kdlxtbz='Y' order by sq_yhxx.dwbh,yhmc ",yhdlm);
%>
			   </select>
                <font style="FONT-SIZE:14px;" color="#000066"><b>
正权限<input type="radio" name="qxlx" value="Y" <% if(qxlx.equals("Y")) out.println("checked");%> onclick="changeqx(authname,this)">
负权限<input type="radio" name="qxlx" value="N" <% if(qxlx.equals("N")||qxlx.equals("")) out.println("checked");%> onclick="changeqx(authname,this)">
                </b></font> 
                <input type="button" value="存盘" onClick="submit_onclick(authname)">
				<input type="reset" value="取消" >
              </td>
            </tr>
            <tr> 
              <td height="376" valign="top"> 

				<table  border="0" style="FONT-SIZE:12" cellspacing="0" cellpadding="0">
<%
	row=0;

	if (!yhdlm.equals(""))
	{
		sql="select cdbh,cdxsmc,glurl,fcdbh,zfcdbh,zzfcdbh,sfmjcd,cdsm,cdxh";
		sql+=" from sq_cd ";
		sql+=" where cdbh not in('0106','010601','010602')";
		sql+=" order by cdbh,cdxh";
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			cdbh=rs.getString("cdbh").trim();
			cdxsmc=rs.getString("cdxsmc");
			glurl=rs.getString("glurl");
			fcdbh=rs.getString("fcdbh").trim();
			zfcdbh=rs.getString("zfcdbh").trim();
			zzfcdbh=rs.getString("zzfcdbh").trim();
			sfmjcd=rs.getString("sfmjcd");
			cdsm=rs.getString("cdsm");
			cdxh=rs.getInt("cdxh");

			thisName="cdbh"+cdbh;
			if (fcdbh.equals("0"))
			{
				fatherName="foldersTree";
			}
			else{
				fatherName="cdbh"+fcdbh;
			}
			String mark="";
			if (!(yhdlm.equals("")))
			{
				sql="select cdbh from sq_yhewqx where yhdlm='"+yhdlm+"' and cdbh='"+cdbh+"' and qxlx='"+qxlx+"'";
				ps1=conn.prepareStatement(sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					mark="checked";
				}
				rs1.close();
				ps1.close();
			}


			if (cdbh.length()==2)
			{
				if (sfmjcd.equals("N"))
				{
					%><tr><td><A href='javascript:cLN("<%=cdbh%>",<%=row%>)' ><img src='ff.gif' border=0><img src='hh.gif' border=0></A><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><B><font color="#006666"><%=cdxsmc%></font></B></td></tr><%
				}
				else{
					%><tr><td><img src='dd.gif' border=0><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><%=cdxsmc%></td></tr><%
				}
			}
			else if (cdbh.length()==4)
			{
				if (sfmjcd.equals("N"))
				{
					%><tr id='id<%=cdbh%>' style="display:none"><td><img src='bb.gif' ><A href='javascript:cLN("<%=cdbh%>",<%=row%>)' ><img src='ff.gif' border=0><img src='hh.gif' border=0></A><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><B><font color="#006666"><%=cdxsmc%></font></B></td></tr><%
				}
				else{
					%><tr id='id<%=cdbh%>' style="display:none"><td><img src='bb.gif'><img src='dd.gif'><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><%=cdxsmc%></td></tr><%
				}
			}
			else if (cdbh.length()==6)
			{
				if (sfmjcd.equals("N"))
				{
					%><tr id='id<%=cdbh%>' style="display:none"><td><img src='bb.gif'><img src='bb.gif'><img src='bb.gif'><A href='javascript:cLN("<%=cdbh%>",<%=row%>)' ><img src='ff.gif' border=0><img src='hh.gif' border=0></A><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><B><font color="#006666"><%=cdxsmc%></font></B></td></tr><%
				}
				else{
					%><tr id='id<%=cdbh%>' style="display:none"><td><img src='bb.gif'><img src='bb.gif'><img src='bb.gif'><img src='dd.gif'><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><%=cdxsmc%></td></tr><%
				}
			}
			else if (cdbh.length()==8)
			{
				if (sfmjcd.equals("N"))
				{
					%><tr id='id<%=cdbh%>' style="display:none"><td><img src='bb.gif'><img src='bb.gif'><img src='bb.gif'><img src='bb.gif'><A href='javascript:cLN("<%=cdbh%>",<%=row%>)' ><img src='ff.gif' border=0><img src='hh.gif' border=0></A><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><B><font color="#006666"><%=cdxsmc%></font></B></td></tr><%
				}
				else{
					%><tr id='id<%=cdbh%>' style="display:none"><td><img src='bb.gif'><img src='bb.gif'><img src='bb.gif'><img src='bb.gif'><img src='dd.gif'><input type="checkbox" <%=mark%> name="cdbh<%=cdbh%>" value="cdbh<%=cdbh%>" onclick=cST("<%=cdbh%>",<%=row%>)><%=cdxsmc%></td></tr><%
				}
			}

			row++;

		}
		rs.close();
		ps.close();
	}
%>			
			</table>

              </td>
            </tr>
          </table>
      </form>
	
	</td>
  </tr>
  <tr>
      <td height="5">&nbsp;</td>
  </tr>
</table>
</center>
</body>
</html>

<%
	}
	catch(Exception e){
		out.println("Exception:"+e.getMessage());
		return;
	}
	finally{
		if (rs!=null) rs.close();
		if (ps!=null) ps.close();
		if (rs1!=null) rs1.close();
		if (ps1!=null) ps1.close();
		if (conn != null) cf.close(conn); 
	}
%>			



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script>

function changeqx(FormName,ra1)//参数FormName:Form的名称
{
	var oldvalue='<%=qxlx%>';
	if(	javaTrim(FormName.yhdlm)=="") {
		FormName.yhdlm.focus();
		return false;
	}
	if (oldvalue==ra1.value)
	{
		return;
	}
	FormName.action="yhewsq.jsp";
	FormName.submit();
	return true;
}
function changeuser(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.yhdlm)=="") {
		alert("请选择[用户编号]！");
		FormName.yhdlm.focus();
		return false;
	}
	FormName.action="yhewsq.jsp";
	FormName.submit();
	return true;
}

function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("请选择[用户编号]！");
		FormName.yhdlm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
</SCRIPT>
