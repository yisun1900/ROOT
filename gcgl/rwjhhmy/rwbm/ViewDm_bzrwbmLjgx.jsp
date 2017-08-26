<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "隶书";
}
-->
</style>
</head>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<center>
    <span class="STYLE2">标准任务逻辑关系</span>  </center>

  <table border="0" cellspacing="0" cellpadding="1" width="200%" style='FONT-SIZE: 12px' >
<%
	int count=0;
	int rwxh=0;
	String rwbm=null;
	String rwmc=null;
	int changdu=0;
	int jishu=0;
	int jishucd=0;
	int jgchangdu=0;
	
	ls_sql="update gdm_rwbm set changdu=length(rwmc)+1,jishu=1";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//获取：级数＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="select rwbm,jishu ";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		jishu=rs.getInt("jishu");

		int maxjishu=0;
		ls_sql="select max(gdm_rwbm.jishu)+1 ";
		ls_sql+=" from  dm_bzrwljgx,gdm_rwbm";
		ls_sql+=" where  dm_bzrwljgx.qzrwbm=gdm_rwbm.rwbm and dm_bzrwljgx.rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			maxjishu=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (maxjishu==0)
		{
			maxjishu=1;
		}

		ls_sql="update gdm_rwbm set jishu="+maxjishu;
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//获取：级数＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

	//级数间隔长度：处理前置、后置任务增加宽度，每个加2＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="select rwbm,jishu,changdu";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" order by jishu";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=rs.getString("rwbm");
		jishu=rs.getInt("jishu");
		changdu=rs.getInt("changdu");


		//判断本级是否有前置任务
		ls_sql="select count(*)";
		ls_sql+=" from  dm_bzrwljgx";
		ls_sql+=" where  rwbm in(select rwbm from gdm_rwbm where jishu="+jishu+")";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//有加2
		{
			changdu+=2;
		}

		//判断本级是否有后置任务
		ls_sql="select count(*)";
		ls_sql+=" from  dm_bzrwljgx";
		ls_sql+=" where  qzrwbm in(select rwbm from gdm_rwbm where jishu="+jishu+")";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//有加2
		{
			changdu+=1;
		}

		ls_sql="update gdm_rwbm set jgchangdu="+changdu;
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//级数间隔长度：处理前置、后置任务增加宽度，每个加2＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

	//获取：级数长度＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="select rwbm,jishu ";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		jishu=rs.getInt("jishu");

		int maxjgchangdu=0;
		ls_sql="select max(gdm_rwbm.jgchangdu)";
		ls_sql+=" from  gdm_rwbm";
		ls_sql+=" where  jishu="+jishu;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			maxjgchangdu=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="update gdm_rwbm set jishucd="+maxjgchangdu;
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//获取：级数长度＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成




	//获取：每级累计宽度＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int maxjishu=0;
	ls_sql="select max(gdm_rwbm.jishu)";
	ls_sql+=" from  gdm_rwbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		maxjishu=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//每级宽度
	int perjikd[]=new int[maxjishu];
	int row=0;
	ls_sql="select distinct jishu,jishucd";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" order by jishu";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jishu=rs.getInt(1);
		jishucd=rs.getInt(2);

		perjikd[row]=jishucd;

		row++;
	}
	rs.close();
	ps.close();

	//获取：每级累计宽度＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成


	ls_sql="update dm_bzrwljgx set rwjs=(select jishu from gdm_rwbm where gdm_rwbm.rwbm=dm_bzrwljgx.rwbm)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update dm_bzrwljgx set qzrwjs=(select jishu from gdm_rwbm where gdm_rwbm.rwbm=dm_bzrwljgx.qzrwbm)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String qzrwmc="";
	ls_sql="select rwxh,rwbm,rwmc,changdu,jishu,jishucd ";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwxh=rs.getInt("rwxh");
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		changdu=rs.getInt("changdu");
		jishu=rs.getInt("jishu");
		jishucd=rs.getInt("jishucd");

		qzrwmc="";
		ls_sql="select qzrwbm";
		ls_sql+=" from  dm_bzrwljgx";
		ls_sql+=" where dm_bzrwljgx.rwbm='"+rwbm+"'";
		ls_sql+=" order by qzrwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			qzrwmc+="、["+cf.fillNull(rs1.getString("qzrwbm"))+"]";
		}
		rs1.close();
		ps1.close();
		if (!qzrwmc.equals(""))
		{
			qzrwmc="前置任务："+qzrwmc.substring(1);
		}

		String qzrwbm=null;
		ls_sql="select qzrwbm";
		ls_sql+=" from  dm_bzrwljgx";
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qzrwbm=cf.fillNull(rs1.getString("qzrwbm"));
		}
		rs1.close();
		ps1.close();

		//处理左侧符号＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String leftStr="";
		if (jishu>1)
		{
			int jishucd1=0;
			ls_sql="select jishucd";
			ls_sql+=" from  gdm_rwbm";
			ls_sql+=" where jishu="+1;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jishucd1=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			for (int j=0;j<jishucd1 ;j++ )
			{
				leftStr+="&nbsp;&nbsp;";
//				leftStr+="号";
			}

			for (int i=2;i<jishu ;i++ )
			{
				int markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  dm_bzrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
				ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
				ls_sql+="   and rwjs="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					leftStr+="│";
				}
				else{
					leftStr+="&nbsp;&nbsp;";
				}

				ls_sql="select jishucd";
				ls_sql+=" from  gdm_rwbm";
				ls_sql+=" where jishu="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd1=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd1 ;j++ )
				{
					leftStr+="&nbsp;&nbsp;";
				}

			}
		}

		//处理左侧符号＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		ls_sql="select count(*)";
		ls_sql+=" from  dm_bzrwljgx";
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		String leftBolt="";
		int markInt2=0;
		if (count>0)
		{
			ls_sql="select count(*)";
			ls_sql+=" from  dm_bzrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
			ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
			ls_sql+="   and rwjs="+jishu;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				markInt2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (markInt2>0)
			{
				leftBolt="├--";
			}
			else{
				leftBolt="└--";
			}
		}


		//处理右侧符号＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String rightBolt="";

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  dm_bzrwljgx";
		ls_sql+=" where  qzrwbm='"+rwbm+"'";
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
			//后置最大级数
			int maxjs=0;
			ls_sql="select max(gdm_rwbm.jishu)";
			ls_sql+=" from  dm_bzrwljgx,gdm_rwbm";
			ls_sql+=" where  dm_bzrwljgx.rwbm=gdm_rwbm.rwbm and dm_bzrwljgx.qzrwbm='"+rwbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				maxjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//从第一级开始依次处理
			int kgcd=0;
			if (jishu==1)
			{
				kgcd=jishucd-changdu;
			}
			else{
				kgcd=jishucd-changdu-2;
			}
			for (int j=0;j<kgcd ;j++ )
			{
				rightBolt+="--";
			}

			for (int i=jishu+1;i<maxjs ;i++ )
			{
				int markInt1=0;
				ls_sql="select count(*)";
				ls_sql+=" from  dm_bzrwljgx";
				ls_sql+=" where qzrwbm='"+rwbm+"' and rwjs="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt1=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  dm_bzrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
				ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
				ls_sql+="   and rwjs="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					if (markInt1>0)
					{
						rightBolt+="┼";
					}
					else
					{
						rightBolt+="╪";
					}
				}
				else{
					if (markInt1>0)
					{
						rightBolt+="┬";
					}
					else
					{
						rightBolt+="--";
					}
				}


				ls_sql="select jishucd";
				ls_sql+=" from  gdm_rwbm";
				ls_sql+=" where jishu="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd ;j++ )
				{
					rightBolt+="--";
//					rightBolt+="开";
				}

			}

			markInt2=0;
			ls_sql="select count(*)";
			ls_sql+=" from  dm_bzrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
			ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
			ls_sql+="   and rwjs="+maxjs;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				markInt2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (markInt2>0)
			{
				rightBolt+="┤";
			}
			else{
				rightBolt+="┐";
			}

			if (maxjs<maxjishu)
			{
				ls_sql="select jishucd";
				ls_sql+=" from  gdm_rwbm";
				ls_sql+=" where jishu="+maxjs;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd ;j++ )
				{
					rightBolt+="&nbsp;&nbsp;";
//					rightBolt+="号";
				}

				for (int i=maxjs+1;i<maxjishu ;i++ )
				{
					markInt2=0;
					ls_sql="select count(*)";
					ls_sql+=" from  dm_bzrwljgx";
					ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
					ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
					ls_sql+="   and rwjs="+i;
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						markInt2=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (markInt2>0)
					{
						rightBolt+="│";
					}
					else{
						rightBolt+="&nbsp;&nbsp;";
					}

					ls_sql="select jishucd";
					ls_sql+=" from  gdm_rwbm";
					ls_sql+=" where jishu="+i;
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						jishucd=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					for (int j=1;j<jishucd ;j++ )
					{
						rightBolt+="&nbsp;&nbsp;";
					}

				}

				markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  dm_bzrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
				ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
				ls_sql+="   and rwjs="+maxjishu;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					rightBolt+="│";
				}
				else{
					rightBolt+="&nbsp;&nbsp;";
				}
			}
		}
		else{
			//从第一级开始依次处理
			int kgcd=0;
			if (jishu==1)
			{
				kgcd=jishucd-changdu;
			}
			else{
				kgcd=jishucd-changdu-2;
			}
			for (int j=0;j<kgcd ;j++ )
			{
				rightBolt+="&nbsp;&nbsp;";
			}

			for (int i=jishu+1;i<maxjishu ;i++ )
			{
				markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  dm_bzrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
				ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
				ls_sql+="   and rwjs="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					rightBolt+="│";
				}
				else{
					rightBolt+="&nbsp;&nbsp;";
				}

				ls_sql="select jishucd";
				ls_sql+=" from  gdm_rwbm";
				ls_sql+=" where jishu="+i;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd ;j++ )
				{
					rightBolt+="&nbsp;&nbsp;";
				}

			}

			markInt2=0;
			ls_sql="select count(*)";
			ls_sql+=" from  dm_bzrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from gdm_rwbm where rwxh < "+rwxh+")";
			ls_sql+="   and rwbm   in(select rwbm from gdm_rwbm where rwxh > "+rwxh+")";
			ls_sql+="   and rwjs="+maxjishu;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				markInt2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (markInt2>0)
			{
				rightBolt+="│";
			}
			else{
				rightBolt+="&nbsp;&nbsp;";
			}

		}
		//处理右侧符号＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		%>
		<tr align="left"> 
			<td><%=rwxh%></td>
			<td><%=rwbm%></td>
			<td><div hint="<%=qzrwmc%>" ><%=leftStr%><%=leftBolt%>●<%=rwmc%><%=rightBolt%></div></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

//－￣┐┑┓┈┅┇┋┬┃│└├└ ┤○◎◆●★ ┼ ┬ ┴ ┤├ ╪ ╤ │┃╬  
%>

  <div   id="a"   style="position:absolute;font-size:9pt;display:none;border:1px   solid   black;background:lightyellow">   </div>   
	</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<script>   

    
  //页面内元素的onmouseover事件的处理方法   

//document.onmousemove=function()
document.onmouseover=function()
{   
	if(event.srcElement.hint) 
	{   
		a.style.display="block";   
		a.innerHTML=event.srcElement.hint;   
		a.style.left=window.event.clientX+10;   
		a.style.top=window.event.clientY+10;   
		setTimeout("a.style.display='none'",800000);   
	}
	else{   
		a.style.display="none"   
	}   
} 

</script>   
