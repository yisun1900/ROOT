<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String dqbm=request.getParameter("dqbm");
String[] xmbh=request.getParameterValues("xmbh");

String bjbbh=null;
String bjjb=null;
String hxbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
long xh=0;
int count=0;
try {
	conn=cf.getConnection();


	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	ls_sql="select bjjb,bjbbh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjbbh=rs.getString("bjbbh");
	}
	rs.close();
	ps.close();

	//���ӱ��۰汾�Ƿ���ͣ��
	int bjtyMark=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and sfzybb='4'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjtyMark=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  bj_bjxmmxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	int xmpx=0;//��Ŀ����
	ls_sql="select NVL(max(xmpx)+1,1)";
	ls_sql+=" from  bj_bjxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmpx=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)//��Ŀ�Ѵ���
		{
			continue;
		}

		String tcnxmbz="N";//�ײ�����Ŀ��־
		ls_sql="select count(*)";
		ls_sql+=" from  bj_tcbzgcxm";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and hxbm='"+hxbm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			tcnxmbz="Y";
		}

		String glxmbh="";

		if (bjtyMark>0)//��ͣ�ã��ӱ�[bj_jzbjb1]ȡ���ݶ��Ǳ�[bj_jzbjb]
		{
			//������Ŀ���
			ls_sql="select glxmbh";
			ls_sql+=" from  bj_jzbjb1";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' and bj_jzbjb1.bjbbh='"+bjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				glxmbh=cf.fillNull(rs.getString("glxmbh"));
			}
			rs.close();
			ps.close();

			ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf       ,shf       ,ysf       ,qtf       ,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz         ,zdzk       ,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select                ?    ,? ,?   ,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),bj  ,10,bj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,NVL(sfyxdz,'Y'),NVL(zdzk,0),gycl,flmcgg,bz,dqbm,?,'1','1','1',?,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1����Ҫ��2������Ҫ
			ls_sql+=" from bj_jzbjb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' and bj_jzbjb1.bjbbh='"+bjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setLong(2,xh);
			ps.setString(3,khbh);
			ps.setString(4,bjjb);
			ps.setInt(5,xmpx);
			ps.executeUpdate();
			ps.close();


			//���룺�ͻ�������Ŀ��
			ls_sql="insert into bj_khglxmbh (zjxxh,khbh,xmbh,glxmbh) ";
			ls_sql+=" select ?,?,xmbh,glxmbh";
			ls_sql+=" from bj_glxmb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' and bjbbh='"+bjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();

			xh++;
			xmpx++;

			//�ͻ����Ϸ�����bj_khglfxbh��
			ls_sql="delete from bj_khglfxbh ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb1 ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();

			//�Զ�ѡ�������Ŀ
			ls_sql="select count(*)";
			ls_sql+=" from  bj_khglxmbh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count>0)//���ڹ�����Ŀ���Զ�ѡ��
			{
				ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf       ,shf       ,ysf       ,qtf       ,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,sfyxdz         ,zdzk       ,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
				ls_sql+=" select          ?,?+rownum-1,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj     ,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),bj  ,10,bj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,NVL(sfyxdz,'Y'),NVL(zdzk,0),gycl,flmcgg,bz,dqbm,?,'1','1','1',?+rownum-1,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1����Ҫ��2������Ҫ
				ls_sql+=" from bj_jzbjb1 ";
				ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bj_jzbjb1.bjbbh='"+bjbbh+"' ";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ls_sql+="  and xmbh not in(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setLong(2,xh);
				ps.setString(3,khbh);
				ps.setString(4,bjjb);
				ps.setInt(5,xmpx);
				ps.executeUpdate();
				ps.close();

				//���룺�ͻ�������Ŀ��
				ls_sql="insert into bj_khglxmbh (zjxxh,khbh,xmbh,glxmbh) ";
				ls_sql+=" select ?,?,xmbh,glxmbh";
				ls_sql+=" from bj_glxmb1 ";
				ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' ";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ls_sql+="  and xmbh not in(select xmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
				ps.executeUpdate();
				ps.close();

				xh+=count;
				xmpx+=count;

				if (!glxmbh.equals(""))
				{
					out.println("<P>���ѣ���Ŀ���["+xmbh[i]+"]���ڹ�����Ŀ��"+glxmbh);
				}

				//�ͻ����Ϸ�����bj_khglfxbh��
				ls_sql="delete from bj_khglfxbh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
				ls_sql+="                   select ?,?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
				ls_sql+=" from bj_jzglfxb1 ";
				ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"' and bjjbbm='"+bjjb+"'";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
				ps.executeUpdate();
				ps.close();
			}

		}
		else{//δͣ�ã��ӱ�[bj_jzbjb]ȡ���ݶ��Ǳ�[bj_jzbjb1]
			//������Ŀ���
			ls_sql="select glxmbh";
			ls_sql+=" from  bj_jzbjb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' and bj_jzbjb.bjbbh='"+bjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				glxmbh=cf.fillNull(rs.getString("glxmbh"));
			}
			rs.close();
			ps.close();

			ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf       ,shf       ,ysf       ,qtf       ,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,sfyxdz         ,zdzk       ,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select                   ?,?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj     ,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),bj  ,10,bj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,NVL(sfyxdz,'Y'),NVL(zdzk,0),gycl,flmcgg,bz,dqbm,?,'1','1','1',?,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1����Ҫ��2������Ҫ
			ls_sql+=" from bj_jzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' and bjbbh='"+bjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setLong(2,xh);
				ps.setString(3,khbh);
				ps.setString(4,bjjb);
				ps.setInt(5,xmpx);
			ps.executeUpdate();
			ps.close();


			//���룺�ͻ�������Ŀ��
			ls_sql="insert into bj_khglxmbh (zjxxh,khbh,xmbh,glxmbh) ";
			ls_sql+=" select ?,?,xmbh,glxmbh";
			ls_sql+=" from bj_glxmb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' and bjbbh='"+bjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();

			xh++;
			xmpx++;

			//�ͻ����Ϸ�����bj_khglfxbh��
			ls_sql="delete from bj_khglfxbh ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();

			//�Զ�ѡ�������Ŀ
			ls_sql="select count(*)";
			ls_sql+=" from  bj_khglxmbh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count>0)//���ڹ�����Ŀ���Զ�ѡ��
			{
				ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,sfyxdz         ,zdzk       ,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
				ls_sql+=" select          ?,?+rownum-1,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,bj  ,10,bj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj     ,NVL(sfyxdz,'Y'),NVL(zdzk,0),gycl,flmcgg,bz,dqbm,?,'1','1','1',?+rownum-1,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1����Ҫ��2������Ҫ
				ls_sql+=" from bj_jzbjb ";
				ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"' ";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ls_sql+="  and xmbh not in(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setLong(2,xh);
				ps.setString(3,khbh);
				ps.setString(4,bjjb);
				ps.setInt(5,xmpx);
				ps.executeUpdate();
				ps.close();

				//���룺�ͻ�������Ŀ��
				ls_sql="insert into bj_khglxmbh (zjxxh,khbh,xmbh,glxmbh) ";
				ls_sql+=" select ?,?,xmbh,glxmbh";
				ls_sql+=" from bj_glxmb ";
				ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' ";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ls_sql+="  and xmbh not in(select xmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
				ps.executeUpdate();
				ps.close();

				xh+=count;
				xmpx+=count;

				if (!glxmbh.equals(""))
				{
					out.println("<P>���ѣ���Ŀ���["+xmbh[i]+"]���ڹ�����Ŀ��"+glxmbh);
				}

				//�ͻ����Ϸ�����bj_khglfxbh��
				ls_sql="delete from bj_khglfxbh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
				ls_sql+="                   select ?,?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
				ls_sql+=" from bj_jzglfxb ";
				ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"' and bjjbbm='"+bjjb+"'";
				ls_sql+="  and xmbh in(select glxmbh from bj_khglxmbh where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"') ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
				ps.executeUpdate();
				ps.close();
			}
		}
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>