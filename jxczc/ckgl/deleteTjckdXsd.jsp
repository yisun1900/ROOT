<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//����Ƿ�¼��������
	String lydh="";
	String cklx=null;
	String dqbm=null;
	String ckdzt="";
	String ckbh="";
	ls_sql=" select cklx,dqbm,lydh,ckdzt,ckbh";
	ls_sql+=" from jxc_ckd ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	if (rs.next())
	{
		cklx=cf.fillNull(rs.getString("cklx"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		lydh=cf.fillNull(rs.getString("lydh"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();

	if (!ckdzt.equals("9"))
	{
		out.println("���󣡳��ⵥδ�ύ");
		return;
	}

	jxc.JxcClass jxc=new jxc.JxcClass();
	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//Nδ��ת��Y���ѽ�ת
	{
		out.print("�ϸ���û�н�ת�����ܽ��п�������"+jz);
		return;
	}

	conn.setAutoCommit(false);

	//�����������Ƿ����
	String clbm=null;
	String zljb=null;
	double cksl=0;
	String xsfs=null;
	ls_sql=" select clbm,zljb,xsfs,sum(cksl) cksl ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ls_sql+=" group by clbm,zljb,xsfs ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		zljb=cf.fillNull(rs.getString("zljb"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		cksl=rs.getDouble("cksl");


		//����Ʒ�������
		if (xsfs.equals("1"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
		{
			continue;
		}

		//���£����ϼ۸������������������������������������ʼ
		if (zljb.equals("1"))//����Ʒ
		{
			//�޸Ĳ��ϼ۸������Ʒ������
			ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+cksl+",dhsl=dhsl+"+cksl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (zljb.equals("2"))//�д�Ʒ
		{
			//�޸Ĳ��ϼ۸��д�Ʒ������
			ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+cksl+",dhsl=dhsl+"+cksl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (zljb.equals("3"))//����Ʒ
		{
			//�޸Ĳ��ϼ۸����Ʒ������
			ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+cksl+",dhsl=dhsl+"+cksl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		//���£����ϼ۸��������������������������������������
	}
	rs.close();
	ps.close();

	//���£���������������������������������������ʼ
	//����������ˮ��
	int maxlsh=0;
	ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
	ls_sql+=" from jxc_kcb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())//����л� ֱ�Ӹ�������
	{
		maxlsh=rs.getInt("lsh");
	}
	rs.close();
	ps.close();


	String lsh=null;
	String ylsh=null;
	double rkj=0;
	double kcje=0;

	ls_sql=" select lsh,clbm,cksl,rkj";
	ls_sql+=" from jxc_ckcpxx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		ylsh=cf.fillNull(rs.getString("lsh"));
		clbm=cf.fillNull(rs.getString("clbm"));
		cksl=rs.getDouble("cksl");
		rkj=rs.getDouble("rkj");

		//�޸�:�Ƿ��и����
		ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
		ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		kcje=cksl*rkj;

		//����������ˮ��
		maxlsh++;
		lsh=maxlsh+"";
		lsh=cf.addZero(lsh,13);

		//���������Ʒ��Ϣ�����ݷ�������
		ls_sql =" insert into jxc_kcb (kcsl,kcje,lsh   ,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,ztbz)";
		ls_sql+=" select               ?   ,?   ,?     ,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,NVL(lsj,0),NVL(xsj,0),NVL(dfgsjg,0),NVL(dgzjg,0),ztbz";
		ls_sql+=" from jxc_ckcpxx ";
		ls_sql+=" where ckph='"+ckph+"' and lsh='"+ylsh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,cksl);
		ps1.setDouble(2,kcje);
		ps1.setString(3,lsh);
		ps1.executeUpdate();
		ps1.close();

		//��Ȩƽ���ɱ���
		jxc.JsJqpjcbj(conn,dqbm,clbm);
	}
	rs.close();
	ps.close();
	//���£�����������������������������������������

	//ɾ�����������Ʒ��Ϣ��
	ls_sql="delete from jxc_ckcpxx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���³��ⵥ״̬
	ls_sql=" update jxc_ckd set ckdzt='0',sfyfkc='1',ckzsl=0,ckzje=0,ckzcb=0 ";//1���޸����
	ls_sql+=" where  ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//����:���۵�:״̬�����۵���ϸ:������������������������������������ʼ
	int mark=0;
	int mark1=0;
	double xssl=0;
	ls_sql=" select clbm,xssl";
	ls_sql+=" from jxc_fcxsmx ";
	ls_sql+=" where xsph='"+lydh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		xssl=rs.getDouble("xssl");

		cksl=0;
		ls_sql=" select sum(cksl) cksl";
		ls_sql+=" from jxc_ckd,jxc_ckmx ";
		ls_sql+=" where jxc_ckd.ckph=jxc_ckmx.ckph and jxc_ckd.cklx='"+cklx+"' and jxc_ckd.lydh='"+lydh+"' and jxc_ckd.ckdzt!='0' and jxc_ckmx.clbm='"+clbm+"'";
		ls_sql+=" group by clbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			cksl=rs1.getDouble("cksl");
		}
		rs1.close();
		ps1.close();

		if (cksl>xssl)
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+clbm+"����������["+cksl+"]������������["+xssl+"]");
			return;
		}
		else if (cksl<xssl)
		{
			mark++;
		}
		if (cksl>0)
		{
			mark1++;
		}

		//���£����۵���ϸ(jxc_fcxsmx).��������cksl
		ls_sql=" update jxc_fcxsmx set cksl="+cksl;
		ls_sql+=" where clbm='"+clbm+"' and xsph='"+lydh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	if (mark1==0)//�޳���
	{
		ls_sql="update jxc_fcxsd set xsdzt='2' ";//0��δ�ύ��2���ύ��3���ѳ��⣻4�����ֳ���
		ls_sql+=" where xsph='"+lydh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{//�г���
		if (mark==0)//ȫ����
		{
			ls_sql="update jxc_fcxsd set xsdzt='3' ";
			ls_sql+=" where xsph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//�в���δ����
			ls_sql="update jxc_fcxsd set xsdzt='4' ";
			ls_sql+=" where xsph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	//����:���۵�.״̬�����۵���ϸ.��������������������������������������

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
		alert("ɾ���ύ�ɹ���");
		window.close();
	//-->
	</SCRIPT>
	&nbsp;<br>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{	conn.setAutoCommit(true);
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