<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
//get����cUserID��cPassword
String yhdlm=request.getParameter("yhdlm").trim();
String yhkl=request.getParameter("yhkl").trim();
String macAddr=request.getParameter("macAddr");

String getYhkl=null;//���ݿ��ѯ�õ���password
String dwbh=null;//��λ���
String sjsbh=null;//��������С��
String dwlx=null;//��λ����
String ckjgbz=null;//�ɲ鿴�۸���Ϣ
String zdyhbz=null;//�ص��û���־
String kkbbz=null;//�ɿ�����־
String yhmc=null;//�û�����
String yhjs=null;//�û���ɫ
String dqbm=null;//��������
String ssfgs=null;//�����ֹ�˾
String zwbm=null;//���ֱ���
String khdhbz=null;//�鿴�ͻ��绰��־
String kfgssq=null;//�ͻ�������Ȩ��Χ
String ygbh=null;//Ա�����
String ip=request.getRemoteHost();


String sjxzbz=null;
int sbsj=0;
int xbsj=0;
String ipxzbz=null;
String ipdz=null;
String wkxzbz=null;
String wkdz=null;

int logonvalue=0;
//��ѯ�û���½��Ϣ

String ip1="";
String ip2="";
String ip3="";
String ip4="";
int pos1=ip.indexOf(".");
ip1=ip.substring(0,pos1);
String oldip=ip.substring(pos1+1);

int pos2=oldip.indexOf(".");
ip2=oldip.substring(0,pos2);
oldip=oldip.substring(pos2+1);


int pos3=oldip.indexOf(".");
ip3=oldip.substring(0,pos3);
ip4=oldip.substring(pos3+1);

try {
	conn=cf.getConnection();   //�õ�����
	if (conn==null)
	{
		out.println("����δȡ�����ݿ����ӣ�����ϵͳ����Ա��ϵ");
		return;
	}

	
	long xh=0;
	sql="select NVL(max(xh),0)+1 ";
	sql+=" from sq_xtrz";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,ip1,ip2,ip3,ip4 ) ";
	sql+=" values ( ?,?,?,SYSDATE,?,?,?,?) ";
	ps= conn.prepareStatement(sql);
	ps.setLong(1,xh);
	ps.setString(2,ip);
	ps.setString(3,cf.GB2Uni(yhdlm));
	ps.setString(4,ip1);
	ps.setString(5,ip2);
	ps.setString(6,ip3);
	ps.setString(7,ip4);
	ps.executeUpdate();
	ps.close();

	//000000:�����û�
	int cjyhbz=0;
	sql="select count(*)";
	sql+=" from sq_yhssz";
	sql+=" WHERE yhzbh='000000' and yhdlm='"+yhdlm+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		cjyhbz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	

	int mmxgsj=0;//���޸�ʱ��
	int lxdlsbcs=0;//����½ʧ�ܴ���
	int sccgdlsj=0;//�ϴγɹ���½ʱ��
	int mmsyzq=0;//����ʹ������
	int yxdlsbcs=0;//�����½ʧ�ܴ���
	int bsxtsmmzq=0;//����ϵͳ����������
	sql="select sq_yhxx.ygbh,sq_yhxx.kfgssq,sq_yhxx.mmsyzq,sq_yhxx.yxdlsbcs,sq_yhxx.bsxtsmmzq,SYSDATE-mmxgsj mmxgsj,SYSDATE-sccgdlsj sccgdlsj,lxdlsbcs,khdhbz,zwbm,yhkl,yhjs,sq_dwxx.dwbh,sq_yhxx.sjsbh,sq_dwxx.dwlx,sq_yhxx.yhmc,sq_dwxx.dqbm,sq_dwxx.ssfgs,ckjgbz,zdyhbz,kkbbz,sjxzbz,sbsj,xbsj,ipxzbz,ipdz,wkxzbz,wkdz";
	sql+=" from sq_yhxx,sq_dwxx ";
	sql+=" WHERE sq_yhxx.dwbh=sq_dwxx.dwbh and yhdlm='"+ yhdlm + "' and sq_dwxx.cxbz='N' and kdlxtbz='Y' and sq_yhxx.sfzszg in('Y','N','C')";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())//�û�����
	{
		ygbh=rs.getString("ygbh");
		kfgssq=cf.fillNull(rs.getString("kfgssq"));//��ֹ�˾��Ȩ
		mmsyzq=rs.getInt("mmsyzq");
		yxdlsbcs=rs.getInt("yxdlsbcs");
		bsxtsmmzq=rs.getInt("bsxtsmmzq");
		mmxgsj=rs.getInt("mmxgsj");
		lxdlsbcs=rs.getInt("lxdlsbcs");
		sccgdlsj=rs.getInt("sccgdlsj");
		khdhbz=rs.getString("khdhbz");
		zwbm=rs.getString("zwbm");
		getYhkl=rs.getString("yhkl").trim();
		yhjs=rs.getString("yhjs");
		ckjgbz=rs.getString("ckjgbz");
		zdyhbz=rs.getString("zdyhbz");
		dwbh=rs.getString("dwbh");
		sjsbh=rs.getString("sjsbh");
		dwlx=rs.getString("dwlx");
		yhmc=rs.getString("yhmc").trim();
		dqbm=rs.getString("dqbm");
		ssfgs=rs.getString("ssfgs");
		kkbbz=rs.getString("kkbbz");

		sjxzbz=cf.fillNull(rs.getString("sjxzbz"));//ʱ�����Ʊ�־
		sbsj=rs.getInt("sbsj");
		xbsj=rs.getInt("xbsj");
		ipxzbz=cf.fillNull(rs.getString("ipxzbz"));//IP��ַ���Ʊ�־
		ipdz=cf.fillNull(rs.getString("ipdz"));
		wkxzbz=cf.fillNull(rs.getString("wkxzbz"));//������ַ���Ʊ�־
		wkdz=cf.fillNull(rs.getString("wkdz"));
	}
	rs.close();
	ps.close();

//		out.println(sql);

	if (dwbh!=null)//�ڲ��û�����
	{
		if (lxdlsbcs>yxdlsbcs)//�����½ʧ�ܴ���
		{
			sql=" update sq_yhxx set kdlxtbz='N'";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("����������½ʧ���ˡ�"+lxdlsbcs+"���Σ�����ϵͳ����ġ�"+yxdlsbcs+"���Σ��ʺű�����������ϵϵͳ����Ա");
			return;
		}

		//��֤�����Ƿ���ȷ
		if (yhkl.equals("111111"))
		{
		}
		else{
			yhkl=cf.makejm(yhkl);
		}

		out.println(yhkl);
		out.println(cf.makejm(getYhkl));

		if (getYhkl.equals(yhkl))//������ȷ
		{

			if (cjyhbz==0)
			{
				if (sccgdlsj>bsxtsmmzq)//����ϵͳ����������
				{
					sql=" update sq_yhxx set kdlxtbz='N'";
					sql+=" WHERE yhdlm='"+ yhdlm + "'";
					ps= conn.prepareStatement(sql);
					ps.executeUpdate();
					ps.close();

					out.println("�ʺų�����"+bsxtsmmzq+"����δʹ�ã�������");

					return;
				}
			}

			if (mmxgsj>mmsyzq)//����ʹ������
			{
				out.println("����ʹ���ѳ���"+mmsyzq+"�죬���޸�����");
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
				return;
			}

			
			//����½ϵͳ���ƣ�����������������������ʼ
			if (sjxzbz.equals("Y"))//N�������ƣ�Y������
			{
				//ȡʱ��
				int getsj=0;

				getsj=java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY );

				if (sbsj>getsj || getsj>xbsj)
				{
					out.println("�����ϰ�ʱ�䲻��ȷ��"+getsj);
					return;
				}
			}

			if (ipxzbz.equals("Y"))//N�������ƣ�Y������
			{
				//ȡIP��ַ
				String getipdz=request.getRemoteAddr();
				if (!getipdz.equals(ipdz))
				{
					out.println("����IP��ַ����ȷ��"+getipdz);
					return;
				}
			}

			if (wkxzbz.equals("Y"))
			{
				if (!wkdz.equals(macAddr))
				{
					out.println("����������ַ����ȷ��"+macAddr);
					return;
				}
			}

			//����½ϵͳ����====================����


			if (zdyhbz==null)
			{
				zdyhbz="N";
			}
			if (kkbbz==null)
			{
				kkbbz="N";
			}
			if (zwbm==null)
			{
				zwbm="99";
			}
			if (khdhbz==null)
			{
				khdhbz="N";
			}


			if (getYhkl.equals("111111"))
			{
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
				return;
			}
			else{
				sql=" update sq_yhxx set lxdlsbcs=0,sccgdlsj=SYSDATE";
				sql+=" WHERE yhdlm='"+ yhdlm + "'";
				ps= conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				
				session.setAttribute("zwbm",zwbm);
				session.setAttribute("ssfgs",ssfgs);
				session.setAttribute("yhdlm",yhdlm);
				session.setAttribute("yhjs",yhjs);
				session.setAttribute("dwbh",dwbh);
				session.setAttribute("sjsbh",sjsbh);
				session.setAttribute("dwlx",dwlx);
				session.setAttribute("yhmc",yhmc);
				session.setAttribute("kfgssq",kfgssq);
				session.setAttribute("ygbh",ygbh);

				session.setAttribute("dqbm",dqbm);
				session.setAttribute("ckjgbz",ckjgbz);
				session.setAttribute("zdyhbz",zdyhbz);
				session.setAttribute("kkbbz",kkbbz);
				session.setAttribute("khdhbz",khdhbz);

				response.sendRedirect("main.html");
				return;
			}
		}
		else{//���벻��ȷ
			sql=" update sq_yhxx set lxdlsbcs=NVL(lxdlsbcs,0)+1 ";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("���벻��ȷ��<A HREF='/xtsq/yhxx/wjMm.jsp?yhdlm="+yhdlm+"'>�һ�����</A>");
			return;
		}
	}
	else{//�ڲ��û�������

		sql="select gysbm,mmsyzq,yxdlsbcs,SYSDATE-mmxgsj mmxgsj,lxdlsbcs,yhkl,'G0' yhjs,gysbm dwbh,'G0' dwlx,yhmc,ssfgs,'N' ckjgbz,'N' zdyhbz";
		sql+=" from jxc_ppgysdzb ";
		sql+=" WHERE yhdlm='"+ yhdlm + "' and kdlxtbz='Y' and sfsd='N'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())//�û�����
		{
			ygbh=rs.getString("gysbm");
			mmsyzq=rs.getInt("mmsyzq");
			yxdlsbcs=rs.getInt("yxdlsbcs");
			mmxgsj=rs.getInt("mmxgsj");
			lxdlsbcs=rs.getInt("lxdlsbcs");
			getYhkl=rs.getString("yhkl").trim();
	//		out.println("<BR>getYhkl="+getYhkl);
			yhjs=rs.getString("yhjs");
			ckjgbz=rs.getString("ckjgbz");
			zdyhbz=rs.getString("zdyhbz");
			dwbh=rs.getString("dwbh");
			dwlx=rs.getString("dwlx");
			yhmc=rs.getString("yhmc");
			ssfgs=rs.getString("ssfgs");
		}
		rs.close();
		ps.close();

		sql="select dqbm ";
		sql+=" from sq_dwxx ";
		sql+=" WHERE dwbh='"+ ssfgs + "'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())//�û�����
		{
			dqbm=rs.getString("dqbm");
		}
		rs.close();
		ps.close();
	}

	if (dwbh!=null)//��Ӧ�̴���
	{
		if (lxdlsbcs>yxdlsbcs)//���ʺ�
		{
/*
			sql=" update jxc_ppgysdzb set kdlxtbz='N'";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("����������½ʧ���ˡ�"+lxdlsbcs+"���Σ�����ϵͳ����ġ�"+yxdlsbcs+"���Σ��ʺű�����������ϵϵͳ����Ա");
			return;
*/
		}
	
		if (yhkl.equals("111111"))
		{
		}
		else{
			yhkl=cf.makejm(yhkl);
		}

		if (getYhkl.equals(yhkl))//������ȷ
		{
/*			
			if (mmxgsj>mmsyzq)
			{
				out.println("����ʹ���ѳ���["+mmsyzq+"]�죬���޸�����");
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
			}
*/			
			if (zdyhbz==null)
			{
				zdyhbz="N";
			}


			//��֤�����Ƿ���ȷ
			if (getYhkl.equals("111111"))
			{
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
				return;
			}
			else{
				sql=" update jxc_ppgysdzb set lxdlsbcs=0";
				sql+=" WHERE yhdlm='"+ yhdlm + "'";
				ps= conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				session.setAttribute("zwbm","99");
				session.setAttribute("ssfgs",ssfgs);
				session.setAttribute("yhdlm",yhdlm);
				session.setAttribute("yhjs",yhjs);
				session.setAttribute("dwbh",dwbh);
				session.setAttribute("dwlx",dwlx);
				session.setAttribute("yhmc",yhmc);
				session.setAttribute("kfgssq","");
				session.setAttribute("sjsbh","");
				session.setAttribute("ygbh",ygbh);

				session.setAttribute("dqbm",dqbm);
				session.setAttribute("ckjgbz",ckjgbz);
				session.setAttribute("zdyhbz",zdyhbz);
				session.setAttribute("kkbbz","N");

				response.sendRedirect("main.html");
				return;
			
			}
		}
		else{
			sql=" update jxc_ppgysdzb set lxdlsbcs=NVL(lxdlsbcs,0)+1 ";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("�û������벻��ȷ");
		}
	}
	else//�û���½��������
	{
		out.println("�û������벻��ȷ���򲻿ɵ�½");
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%>


