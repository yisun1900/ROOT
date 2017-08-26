<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp"%>

<%
String dwbh=(String) session.getAttribute("dwbh");
String yhdlm=(String) session.getAttribute("yhdlm");
String gzrq=(String) session.getAttribute("gzrq");
String yhjs=(String)session.getAttribute("yhjs");
String zgsbh=(String)session.getAttribute("zgsbh");
if (yhjs.equals("00"))//00：总公司
{
	dwbh=zgsbh;
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

try{
	conn=cf.getConnection();

	int count=0;

	sql="select count(*) ";
	sql+="  from cp_qmjzjl where  kcrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1)))";  
//	out.println(sql);
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//从数据库中取出当前库存日期 
	} 
	rs.close();
	ps.close();
	if (count==0)
	{
		out.println("上月没有进行库存结转，不能进行库存操作！");
		return;
	}
}
catch (Exception e) { 
	   out.print("数据库操作失败：" + e); 
	   return;
}finally{ 
 try{ 
	 if(rs!=null) rs.close();
	 if (ps!= null) ps.close();  
	 if (conn != null) cf.close(conn);   
   }catch (Exception e){  
	  out.println("数据库操作失败："+e.getMessage());  
   }  
} 
%>  
<html>
<head>
<title>填写产品条码</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" >
<form name="thd" method="post" action="thcpbmList.jsp">
<p align="center">退货单</p>
<div align="center"></div>
<div align="center">
    <table style="FONT-SIZE: 12px"  width=100% bgcolor=#999999 border=0 >
      <tr bgcolor=#ffffff> 
        <td height="19" width=20% align="right">退货单位</td>
        <td height="19" width=30%> 
          <select name="thdw" style="FONT-SIZE:12px;WIDTH:152px">
            <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
          </select>
        </td>
        <td height="19" width=20% align=center>&nbsp;</td>
        <td height="19" width=30%>&nbsp;</td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td height="19" width=20%> 
          <p align="right">退货日期</p>
        </td>
        <td height="19" width=30%> 
          <input type="text" name="thrq" size="20"  value=<%=gzrq%> maxlength="10">
        </td>
        <td height="19" width=20% align=center> 
          <div align="right">操作员</div>
        </td>
        <td height="19" width=30%> 
          <input type="text" name="czy" value="<%=yhdlm%>" size="20">
        </td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td height="1" bgcolor="#C0C0C0" colspan="4" width=100%>&nbsp; </td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td height="23" colspan="4" width=100%> 
          <div align="center">退货列表</div>
        </td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td width=15% height="20"> 
          <div align="right">产品编码 </div>
        </td>
        <td width=35% height="20"> 
          <div align="left"> 
            <input type="text" name="cpbm" size="20"  maxlength="13" >
          </div>
        </td>
        <td width=20% height="20"> 
          <div align="right">
            <input type="button"  value="加入列表" onClick="add(thd)">
          </div>
        </td>
        <td width=30% height="20"> 
          <div align="left"> </div>
        </td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td height=43 align="center" valign="middle" width=20%> 
          <p align="right"> 
            <input type="button"  value="删除条码" onClick="remove(thd)">
          </p>
          <p align="right"> 
            <input type="button"   value="清空列表" onClick="resetList(document.thd.cpbmlist);">
          </p>
        </td>
        <td height=43 align="center" valign="middle" colspan="3" width=80%> 
          <select  name="cpbmlist" style="font-size: height: 156; width: 415"  size="12" multiple>
          </select>
        </td>
      </tr>
      <tr> 
        <td height=1 colspan=4 width=100%> 
          <p align="center"> 
            <input  type="button"  value="下一步"  onClick="submit_Check(thd);" >
            <input type=reset value='重  置' >
          </p>
        </td>
      </tr>
    </table>
</div>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>                                                                                                                                 
<SCRIPT language=javascript > 


//清空列表   
function resetList(listname){   
   while (listname.length>0){   
      listname.options[0]=null;   
   } //end of while loop   
}   

function add(FormName)//参数FormName:Form的名称
{
	if (FormName.cpbm.value.length<13){                                                                                                         
		alert("条码应该为13位！");        
		FormName.cpbm.focus() ;  
		return;
	}        
	if (isExisted(FormName.cpbmlist,FormName.cpbm.value)!=-1){        
		alert("此条码已被扫入到列表中！");        
//		FormName.cpbm.value="";        
		FormName.cpbm.focus() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.cpbm.value;
	op1.text=FormName.cpbmlist.options.length+1+":"+FormName.cpbm.value;
	FormName.cpbmlist.add(op1);
	FormName.cpbm.select();
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=FormName.cpbmlist.options.length-1; i>=0; i--)
	{
		if (FormName.cpbmlist.options[i].selected)
		{
			FormName.cpbmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.cpbmlist.options.length; i++)
	{
		FormName.cpbmlist.options[i].text=i+1+":"+FormName.cpbmlist.options[i].value;
	}
}

//判断重复录入                                          
  
function isExisted(o,val){//在出库产品列表中判断        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value.substring(0,13)==val) return index;  
		index++;  
	}    
	return -1;    
}        


//提交表单之前进行合法性检验
function submit_Check(fm){  
	if(	javaTrim(fm.thrq)=="") {
		alert("请输入[退货日期]！");
		fm.thrq.focus();
		return false;
	}
	if (!(isDatetime(fm.thrq,"退货日期"))){     
		fm.thrq.select();     
		return      
	}
   if(fm.cpbmlist.length==0){   
      alert("请输入退货产品条码，点击《加入列表》按钮！");   
		fm.cpbm.select();     
	  return   
   }
   else{   
      for(i=0;i<fm.cpbmlist.length;i++){                                                                      
        fm.cpbmlist.options[i].selected = true;                                                                      
      }                                                                                                                     
   }   
   fm.submit();   
}   

</SCRIPT>