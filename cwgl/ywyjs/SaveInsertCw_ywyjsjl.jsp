<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String fgsbh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

String ywy=null;
ywy=cf.GB2Uni(request.getParameter("ywy"));

java.sql.Date sjfw=null;
java.sql.Date sjfw2=null;
ls=request.getParameter("sjfw");
try{
	if (!(ls.equals("")))  sjfw=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfw������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʱ�䷶Χ]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjfw2");
try{
	if (!(ls.equals("")))  sjfw2=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfw2������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʱ�䷶Χ]����ת����������:"+e);
	return;
}

double xdsskbfb=0;
ls=request.getParameter("xdsskbfb");
try{
	if (!(ls.equals("")))  xdsskbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xdsskbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޶�ʵ�տ�ٷֱ�]����ת����������:"+e);
	return;
}

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String[] khbh=request.getParameterValues("khbh");
String[] khbh1=request.getParameterValues("khbh1");
String[] khbh2=request.getParameterValues("khbh2");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String qdlx=null;
	String tclx=null;
	double tcjs=0;//��ɻ���
	double ytcbl=0;//����ɱ���
	double ytcje=0;//����ɽ��
	double bctcbl=0;//������ɱ���
	double bctcje=0;//������ɽ��
	double sjtcje=0;//ʵ����ɽ��

	conn.setAutoCommit(false);

	//ǩ�����
	if (khbh!=null)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String ywyjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,ywyjsbz,ywyqdjsbl,ywyqdjsje,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh[i]+"' ";//0��δ���㣻1��ǩ�����㣻2���깤����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
				ytcbl=rs.getDouble("ywyqdjsbl");
				ytcje=rs.getDouble("ywyqdjsje");
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();

			if (!ywyjsbz.equals("0"))
			{
				conn.rollback();
				out.println("����ҵ��Ա�����־����ȷ��"+khbh[i]);
				return;
			}

			//��ɻ���
			double ywyzkl=0;
			if (cxhdbm.equals(""))//�޻
			{
				tcjs=qye;
			}
			else{
				ls_sql="select ywyzkl";
				ls_sql+=" from  jc_cxhd";
				ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+getfgsbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ywyzkl=rs.getDouble("ywyzkl");
				}
				else{
					conn.rollback();
					out.println("���󣡴������"+cxhdbm+"��ҵ��Ա���ϵ��");
					return;
				}
				rs.close();
				ps.close();

				tcjs=wdzgce*ywyzkl/100;
			}

			tcjs=cf.doubleTrim(tcjs);


			//qd��ǩ�����������
			double qdjsbl=0;
			ls_sql="select csz";
			ls_sql+=" from  cw_ywyjscs";
			ls_sql+=" where csbm='qd' and fgsbh='"+getfgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qdjsbl=rs.getDouble("csz");
			}
			else{
				conn.rollback();
				out.println("����ǩ���������������");
				return;
			}
			rs.close();
			ps.close();

			//gz����װ�������ֵ��
			double gzzdjscz=0;
			ls_sql="select csz";
			ls_sql+=" from  cw_ywyjscs";
			ls_sql+=" where csbm='gz' and fgsbh='"+getfgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gzzdjscz=rs.getDouble("csz");
			}
			else{
				conn.rollback();
				out.println("���󣡹�װ�������ֵ������");
				return;
			}
			rs.close();
			ps.close();
			
			
			tclx="1";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
			
			if (jzbz.equals("2"))//1����װ��2����װ
			{
				qdlx="3";//1����װ��3����װ
				
				if (tcjs>gzzdjscz)//��װ��Ŀ����*��Ԫ����*��Ԫ������ɣ��������ֲ��Ʋ�ֵ
				{
					tcjs=gzzdjscz;
				}
			}
			else
			{
				qdlx="1";//1����װ��3����װ
			}


			//������ɱ���
			ls_sql="select tcbfb";
			ls_sql+=" from  cw_ywytcbl";
			ls_sql+=" where qd<"+tcjs+" and zd>="+tcjs+" and fgsbh='"+getfgsbh+"' and qdlx='"+qdlx+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				bctcbl=rs.getDouble("tcbfb");
			}
			else{
				conn.rollback();
				out.println("������ɱ��ʲ��������ڣ���ɻ�����"+tcjs);
				return;
			}
			rs.close();
			ps.close();


			bctcje=tcjs*bctcbl/100*qdjsbl/100;


			sjtcje=bctcje;

			ls_sql=" insert into cw_ywyjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
			ls_sql+=" values ( ?,?,?,?,0,?,?,?,?  ,?,0,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jsjlh);
			ps.setString(2,khbh[i]);
			ps.setString(3,qdlx);
			ps.setString(4,tclx);
			ps.setDouble(5,tcjs);
			ps.setDouble(6,ytcbl);
			ps.setDouble(7,ytcje);
			ps.setDouble(8,bctcbl);
			ps.setDouble(9,bctcje);
			ps.setDouble(10,sjtcje);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx set ywyjsbz='1',ywyqdjsbl=?,ywyqdjsje=?,ywyjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh[i]+"' ";//0��δ���㣻1��ǩ�����㣻2���깤����
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}

	//�깤���
	if (khbh1!=null)
	{
		for (int i=0;i<khbh1.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String ywyjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,ywyjsbz,ywyqdjsbl,ywyqdjsje,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh1[i]+"' ";//0��δ���㣻1��ǩ�����㣻2���깤����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
				ytcbl=rs.getDouble("ywyqdjsbl");
				ytcje=rs.getDouble("ywyqdjsje");
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();

			if (!ywyjsbz.equals("1"))
			{
				conn.rollback();
				out.println("����ҵ��Ա�����־����ȷ��"+khbh1[i]);
				return;
			}

			//��ɻ���
			double ywyzkl=0;
			if (cxhdbm.equals(""))//�޻
			{
				tcjs=qye+zhzjxje;
			}
			else{
				ls_sql="select ywyzkl";
				ls_sql+=" from  jc_cxhd";
				ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+getfgsbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ywyzkl=rs.getDouble("ywyzkl");
				}
				else{
					conn.rollback();
					out.println("���󣡴������"+cxhdbm+"��ҵ��Ա���ϵ��");
					return;
				}
				rs.close();
				ps.close();

				tcjs=(wdzgce+zjxje)*ywyzkl/100;
			}

			tcjs=cf.doubleTrim(tcjs);


			//gz����װ�������ֵ��
			double gzzdjscz=0;
			ls_sql="select csz";
			ls_sql+=" from  cw_ywyjscs";
			ls_sql+=" where csbm='gz' and fgsbh='"+getfgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gzzdjscz=rs.getDouble("csz");
			}
			else{
				conn.rollback();
				out.println("���󣡹�װ�������ֵ������");
				return;
			}
			rs.close();
			ps.close();


			tclx="2";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�

			if (jzbz.equals("2"))//1����װ��2����װ
			{
				qdlx="3";//1����װ��3����װ
				
				if (tcjs>gzzdjscz)//��װ��Ŀ����*��Ԫ����*��Ԫ������ɣ��������ֲ��Ʋ�ֵ
				{
					tcjs=gzzdjscz;
				}
			}
			else
			{
				qdlx="1";//1����װ��3����װ
			}


			//������ɱ���
			ls_sql="select tcbfb";
			ls_sql+=" from  cw_ywytcbl";
			ls_sql+=" where qd<"+tcjs+" and zd>="+tcjs+" and fgsbh='"+getfgsbh+"' and qdlx='"+qdlx+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				bctcbl=rs.getDouble("tcbfb");
			}
			else{
				conn.rollback();
				out.println("������ɱ��ʲ��������ڣ���ɻ�����"+tcjs);
				return;
			}
			rs.close();
			ps.close();


			bctcje=tcjs*bctcbl/100;
			bctcje=bctcje-ytcje;
			sjtcje=bctcje;

			ls_sql=" insert into cw_ywyjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
			ls_sql+=" values ( ?,?,?,?,0,?,?,?,?  ,?,0,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jsjlh);
			ps.setString(2,khbh1[i]);
			ps.setString(3,qdlx);
			ps.setString(4,tclx);
			ps.setDouble(5,tcjs);
			ps.setDouble(6,ytcbl);
			ps.setDouble(7,ytcje);
			ps.setDouble(8,bctcbl);
			ps.setDouble(9,bctcje);
			ps.setDouble(10,sjtcje);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx set ywyjsbz='2',ywywgjsbl=?,ywywgjsje=?,ywywgjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh1[i]+"' ";//0��δ���㣻1��ǩ�����㣻2���깤����
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}

	

	//�˵�����
	if (khbh2!=null)
	{
		for (int i=0;i<khbh2.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String ywyjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,ywyjsbz,ywyqdjsbl,ywyqdjsje,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh2[i]+"' ";//0��δ���㣻1��ǩ�����㣻2���깤����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
				ytcbl=rs.getDouble("ywyqdjsbl");
				ytcje=rs.getDouble("ywyqdjsje");
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();


			tclx="4";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�

			if (jzbz.equals("2"))//1����װ��2����װ
			{
				qdlx="3";//1����װ��3����װ
			}
			else
			{
				qdlx="1";//1����װ��3����װ
			}


			tcjs=0;
			bctcbl=-1*ytcbl;
			bctcje=-1*ytcje;

			sjtcje=bctcje;

			ls_sql=" insert into cw_ywyjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
			ls_sql+=" values ( ?,?,?,?,0,?,?,?,?  ,?,0,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jsjlh);
			ps.setString(2,khbh2[i]);
			ps.setString(3,qdlx);
			ps.setString(4,tclx);
			ps.setDouble(5,tcjs);
			ps.setDouble(6,ytcbl);
			ps.setDouble(7,ytcje);
			ps.setDouble(8,bctcbl);
			ps.setDouble(9,bctcje);
			ps.setDouble(10,sjtcje);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx set ywyjsbz='2',ywywgjsbl=?,ywywgjsje=?,ywywgjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh2[i]+"' ";//0��δ���㣻1��ǩ�����㣻2���깤����
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}
	

	ls_sql="insert into cw_ywyjsjl ( jsjlh,fgsbh,dwbh,sjsbh,ywy,xdsskbfb,sjfw,sjfw2,tcze,lrr  ,lrsj,lrbm,spbz,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,fgsbh);
	ps.setString(3,"");
	ps.setString(4,"");
	ps.setString(5,ywy);
	ps.setDouble(6,xdsskbfb);
	ps.setDate(7,sjfw);
	ps.setDate(8,sjfw2);
	ps.setDouble(9,0);
	ps.setString(10,lrr);

	ps.setDate(11,lrsj);
	ps.setString(12,lrbm);
	ps.setString(13,"1");//1����ʼ���㣻2��������ɣ�3������ͨ����4������δͨ��
	ps.setString(14,bz);
	ps.executeUpdate();
	ps.close();


	double tcze=0;//����ܶ�
	ls_sql="select sum(sjtcje)";
	ls_sql+=" from  cw_ywyjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update cw_ywyjsjl set tcze=?";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,tcze);
	ps.executeUpdate();
	ps.close();

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
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>